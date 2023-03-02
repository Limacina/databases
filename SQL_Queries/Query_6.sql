/*
Запрос 6.
Для каждого сезона и каждого вида посчитать число наблюдений.
*/

use birds;

select season_type.season_name as season, 
species.latin_name as species, 
count(bird.id_bird) as numb_birds
from bird
inner join season on season.id_bird=bird.id_bird
inner join season_type on season.id_name=season_type.id_name
inner join species on bird.id_species=species.id_species
group by season, species
UNION
select season_type.season_name as season, 
species.latin_name as species,
count(bird.id_bird)
from season_type
left join season on season.id_name=season_type.id_name
left join bird on season.id_bird = bird.id_bird
cross join species 
where season_type.season_name not in (
	select season_type.season_name as season
	from season
	inner join season_type on season.id_name=season_type.id_name
    )
group by species.id_species
order by species;
