/*
Запрос 8.
Найти все виды птиц, число наблюдений которых больше, чем у вида Х.
*/

use birds;

SELECT species.latin_name as species,  count(bird.id_bird) as cnt FROM bird
INNER JOIN species ON species.id_species=bird.id_species
group by species.id_species
having cnt > (SELECT count(bird.id_bird) FROM bird
	INNER JOIN species ON species.id_species=bird.id_species
	WHERE species.latin_name='Yiqqjseurll dibrtrkkhr');

