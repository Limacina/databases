USE birds;

/*
Запрос 2.
Посчитать число птиц вида Х, для которых загружены и фото, и песни.
*/

select count(*) 
from (select bird.id_bird
	FROM bird
	INNER JOIN species ON species.id_species=bird.id_species
	INNER JOIN bird_photo ON bird.id_bird=bird_photo.id_bird
	INNER JOIN bird_song ON bird.id_bird=bird_song.id_bird
	WHERE species.latin_name='Photcgmzieg vsucogzsaq'
	group by bird.id_bird) table_birds;
