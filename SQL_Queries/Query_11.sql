/*
Запрос 1.1
Вывести всех птиц, которых видел в сезон Х бёрдвотчер Y с типом водоёма Z не менее трёх раз.
*/
use birds;

select species.latin_name as "Latin name", 
species.russian_name as "Russian name", 
t as "Meeting time", 
f as "Feather_color", 
size as "Size", 
ph as "Photo", 
song as "Song",
count(b) as cnt
from (select bird.id_bird as b, 
	bird.feath_color as f,
    bird.size as size,
	bird.id_species as s, 
	bird.id_birdwatcher as bw, 
	meeting_time.time_name as t,
    bird_photo.bird_file as ph, 
    bird_song.bird_file as song
	from bird
	INNER JOIN season ON bird.id_bird=season.id_bird
	INNER JOIN season_type ON season.id_name=season_type.id_name
	INNER JOIN lpl ON lpl.id_bird=bird.id_bird
	INNER JOIN pool_type ON lpl.id_pool=pool_type.id_pool
	INNER JOIN meeting_time on meeting_time.id_bird=bird.id_bird
	INNER JOIN bird_photo ON bird.id_bird=bird_photo.id_bird
	INNER JOIN bird_song ON bird.id_bird=bird_song.id_bird	
	Where season_type.season_name = 'лето'
	AND pool_type.pooltype = 'река'
	group by b
) cnt_table
inner join species on cnt_table.s=species.id_species 
inner join birdwatcher on cnt_table.bw=birdwatcher.id_birdwatcher
WHERE birdwatcher.last_name = 'Голубев'
AND birdwatcher.first_name = 'Ярослав' 
AND birdwatcher.fathers_name = 'Георгиевич'
group by s
having cnt >= 3;