/*
Функция, которая принимает на вход название сезона и возвращает число птиц,
встреченных в этом сезоне за последний год.
*/

use birds;

drop function count_birds;

delimiter //
create function count_birds(ssn varchar(30))
returns int
READS SQL DATA
DETERMINISTIC
begin
	declare numb int default 0;
	select count(*) into numb
	from (
	select bird.id_bird
	from bird
	inner join season on bird.id_bird=season.id_bird
	inner join season_type on season.id_name=season_type.id_name
	inner join meeting_time on meeting_time.id_bird=bird.id_bird
	where season_type.season_name = ssn
	and YEAR(meeting_time.time_name) = YEAR(CURDATE())
	) table_proc;
	return numb;
end //
delimiter ;