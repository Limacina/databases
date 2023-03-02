/*
Процедура, которая по заданным имени, фамилии и отчеству бёрдвотчера выводит в
алфавитном порядке названия всех видов птиц, которых человек с таким именем встретил летом.
*/

use birds;

//call species_for_person('Леонид', 'Семёнов', 'Борисович')

drop procedure species_for_person;
create procedure species_for_person(fname varchar(30), lname varchar(30), ftname varchar(30))
	select birdwatcher.id_birdwatcher, species.latin_name as 'Latin name',
	species.russian_name as 'Russian name'
	from bird 
	inner join species on bird.id_species=species.id_species
	inner join birdwatcher on bird.id_birdwatcher=birdwatcher.id_birdwatcher
	inner join season on bird.id_bird=season.id_bird
	inner join season_type on season.id_name=season_type.id_name
	where birdwatcher.last_name = lname
	and birdwatcher.first_name = fname 
	and birdwatcher.fathers_name = ftname
	and season_type.season_name = 'лето'
	group by species.latin_name
	order by species.latin_name;