/*
View, которая показывает количество наблюдений птицы определённого вида в день, месяц и год.
*/

create view species_count as
select latin_name as 'Latin name',
ifnull(count_year, 0) as 'Count year',
ifnull(count_month, 0) as 'Count month',
ifnull(count_day, 0) as 'Count day'
from species
left join
(select species.latin_name as _species,
			count(bird.id_bird) as count_year
            from species
            inner join bird on bird.id_species = species.id_species
			inner join meeting_time on bird.id_bird = meeting_time.id_bird
			where time_name BETWEEN '2022-01-01 00:00:00' AND '2022-12-31 23:59:59'
			group by species.latin_name) as table_year
on species.latin_name = table_year._species
left join
(select species.latin_name as _species,
			count(bird.id_bird) as count_month
            from species
            inner join bird on bird.id_species = species.id_species
			inner join meeting_time on bird.id_bird = meeting_time.id_bird
			where time_name BETWEEN '2022-01-01 00:00:00' AND '2022-01-31 23:59:59'
			group by species.latin_name) as table_month
on species.latin_name = table_month._species
left join
(select species.latin_name as _species,
			count(bird.id_bird) as count_day
            from species
            inner join bird on bird.id_species = species.id_species
			inner join meeting_time on bird.id_bird = meeting_time.id_bird
			where time_name BETWEEN '2022-01-01 00:00:00' AND '2022-01-01 23:59:59'
			group by species.latin_name) as table_day
on species.latin_name = table_day._species

/*
Запрос к этой view
*/

use birds;
select russian_name, count_year
from species 
join species_count
order by russian_name;