/*
Запрос 4.
Посчитать число видов с одинаковым числом птиц.
*/
use birds;

select count(id_species) as SpeciesCount, cnt as BirdCount 
from (select species.id_species, count(bird.id_bird) as cnt
	from species
	inner join bird on species.id_species=bird.id_species
	group by species.id_species) as tmp_table
group by cnt
