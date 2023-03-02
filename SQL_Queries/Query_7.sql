/*
Запрос 8.
Для всех бёрдвотчеров посчитать число птиц.
*/

use birds;

SELECT birdwatcher.id_birdwatcher as birdwatcher,
birdwatcher.last_name as last_name, 
birdwatcher.first_name as first_name, 
birdwatcher.fathers_name as fathers_name,
bird.id_bird,
count(bird.id_bird) as cnt_bird
from birdwatcher
inner join bird on bird.id_birdwatcher=birdwatcher.id_birdwatcher
group by birdwatcher.id_birdwatcher;

SELECT birdwatcher.id_birdwatcher, last_name, 
first_name, 
fathers_name,
count(id_bird_song) as cnt_song 
	from birdwatcher
	inner join bird on bird.id_birdwatcher=birdwatcher.id_birdwatcher
inner join bird_song on bird.id_bird=bird_song.id_bird
group by birdwatcher.id_birdwatcher;
