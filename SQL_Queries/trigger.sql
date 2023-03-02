/*
1) создать таблицу на основе полученной view;
2) при добавлении новой записи в таблицу времени встречи птиц увеличивать
    значение количества встреч соответствующего вида в год, месяц и день.
*/


CREATE TABLE if not exists speciescnt(
primary key auto_increment(id_species) ) AS
  SELECT
	id_species,
	species.latin_name,
	count_year,
	count_month,
	count_day
  FROM species_count
  join species on species.latin_name = species_count.latin_name;



DELIMITER $$
create trigger add_bird
after insert on meeting_time
for each row
begin
	insert ignore into speciescnt(
    speciescnt.id_species,
    speciescnt.latin_name,
    speciescnt.count_year,
    speciescnt.count_month,
    speciescnt.count_day
    )
    SELECT
    species.id_species,
    species.latin_name,
    0, 0, 0
    FROM species where id_species = (
						select id_species
						from bird
						where bird.id_bird = new.id_bird
				);

    if
    new.time_name
    BETWEEN '2022-01-01 00:00:00' AND '2022-12-31 23:59:59' then
    update speciescnt
    set count_year = count_year + 1
    where speciescnt.id_species = (
						select id_species
						from bird
						where bird.id_bird = new.id_bird
				);
    end if;

    if
    new.time_name
    BETWEEN '2022-01-01 00:00:00' AND '2022-01-31 23:59:59' then
    update speciescnt
    set count_month = count_month + 1
    where speciescnt.id_species = (
						select id_species
						from bird
						where bird.id_bird = new.id_bird
				);
    end if;

    if
    new.time_name
	BETWEEN '2022-01-01 00:00:00' AND '2022-01-01 23:59:59' then
    update speciescnt
    set count_day = count_day + 1
    where speciescnt.id_species = (select id_species from bird where bird.id_bird = new.id_bird);
    end if;
end;
