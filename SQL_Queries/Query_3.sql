/*
Запрос 3.
Найти бёрдвотчера, который наблюдал максимальное число птиц (если таких несколько, то вывести всех).
*/

use birds;

SELECT birdwatcher.id_birdwatcher, 
birdwatcher.last_name, 
birdwatcher.first_name, 
birdwatcher.fathers_name,
count(bird.id_bird) as cnt
from birdwatcher
inner join bird on bird.id_birdwatcher=birdwatcher.id_birdwatcher
group by birdwatcher.id_birdwatcher
having cnt = (select count(*) as max_num
	from birdwatcher
	join bird on bird.id_birdwatcher=birdwatcher.id_birdwatcher
	group by birdwatcher.id_birdwatcher
	order by max_num desc LIMIT 1); /* asc for min*/