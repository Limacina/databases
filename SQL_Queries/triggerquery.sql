use birds;
select * from speciescnt where id_species=50;

/*insert into meeting_time (meeting_time.time_name, meeting_time.id_bird)
values('2022-01-01 00:05:00', 49312);
select * from speciescnt where id_species=50;
insert into species (
	species.latin_name,
    species.russian_name,
    species.area,
    species.id_book
) values (
'Parus major',
'Большая синица',
'Ареал',
1
);

insert into bird (
	feath_color,
    beak_shape,
    size,
    tail_shape,
    pool,
    anthr_obj_distance,
    id_species,
    id_birdwatcher)
values ('синий', 'загнутый вниз', 'мелкий', 'короткий', 1, 'рядом с населенным пунктом', 101, 8);

select * from species
where latin_name = 'Parus major';

select * from bird where id_species = 101;
select * from speciescnt where id_species=101;
insert into meeting_time (meeting_time.time_name, meeting_time.id_bird)
values('2022-01-01 00:05:00', 100007);
*/
insert into meeting_time (
	time_name, 
	id_bird
)
values(
	'2022-05-01 00:05:00', 
	100007
);
select * from speciescnt where id_species=101;