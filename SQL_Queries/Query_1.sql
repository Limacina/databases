/*
Запрос 1.
Вывести всех птиц, которых видел в сезон Х бёрдвотчер Y с типом водоёма Z не менее трёх раз.
*/

USE birds;

SELECT bird.id_bird, species.id_species, species.latin_name as 'Latin name',
species.russian_name as 'Russian name',
meeting_time.time_name as 'Meeting time',
bird.feath_color as 'Feather color', 
bird.size as 'Size',
bird_photo.bird_file as 'Photo',
bird_song.bird_file as 'Song'
FROM bird
INNER JOIN species on bird.id_species=species.id_species
INNER JOIN meeting_time on meeting_time.id_bird=bird.id_bird
INNER JOIN birdwatcher ON bird.id_birdwatcher=birdwatcher.id_birdwatcher
INNER JOIN season ON bird.id_bird=season.id_bird
INNER JOIN season_type ON season.id_name=season_type.id_name
INNER JOIN lpl ON lpl.id_bird=bird.id_bird
INNER JOIN pool_type ON lpl.id_pool=pool_type.id_pool
INNER JOIN bird_photo ON bird.id_bird=bird_photo.id_bird
INNER JOIN bird_song ON bird.id_bird=bird_song.id_bird
WHERE birdwatcher.last_name = 'Семёнов'
AND birdwatcher.first_name = 'Леонид' 
AND birdwatcher.fathers_name = 'Борисович'
AND season_type.season_name = 'лето'
AND pool_type.pooltype = 'река'
GROUP BY bird.id_bird;
