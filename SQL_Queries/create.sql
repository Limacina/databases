drop database if exists birds;
create database birds;
use birds;
create table anthr_obj_type(
	id_obj int primary key auto_increment,
    objtype varchar(30)
);
create table plant_type(
	id_plant int primary key auto_increment,
    planttype varchar(30)
);

create table pool_type(
	id_pool int primary key auto_increment,
    pooltype varchar(30)
);

create table season_type(
	id_name int primary key auto_increment,
    season_name varchar(30)
);

create table book(
	id_book int primary key auto_increment,
    author text,
    species_desc longtext,
    pub_info text
);

create table birdwatcher(
	id_birdwatcher int primary key auto_increment,
    last_name varchar(30),
    first_name longtext,
    fathers_name text
);

create table species(
	id_species int primary key auto_increment,
    latin_name varchar(30),
    russian_name varchar(30),
    area text,
    id_book int,
    foreign key (id_book) references book (id_book)
);

create table bird(
	id_bird int primary key auto_increment,
    feath_color varchar(30),
    beak_shape varchar(30),
    size varchar(30),
    tail_shape varchar(30),
    pool tinyint,
    anthr_obj_distance varchar(30),
    id_species int,
    id_birdwatcher int,
    foreign key (id_species) references species (id_species),
    foreign key (id_birdwatcher) references birdwatcher (id_birdwatcher)
);

create table bird_photo(
	id_photo int primary key auto_increment,
    bird_file text,
    id_bird int,
    foreign key (id_bird) references bird (id_bird)
);

create table bird_song(
	id_bird_song int primary key auto_increment,
    bird_file text,
    purpose varchar(30),
    id_bird int,
    foreign key (id_bird) references bird (id_bird)
);

create table species_photo(
	id_species_photo int primary key auto_increment,
    species_file text,
    id_species int,
    foreign key (id_species) references species (id_species)
);

create table species_song(
	id_species_song int primary key auto_increment,
    species_file text,
    purpose varchar(30),
    id_species int,
    foreign key (id_species) references species (id_species)
);

create table la(
	id_la int primary key auto_increment,
    id_obj int,
    id_bird int,
    foreign key (id_bird) references bird (id_bird),
    foreign key (id_obj) references anthr_obj_type (id_obj)
);

create table lpl(
	id_lpl int primary key auto_increment,
    id_pool int,
    id_bird int,
    foreign key (id_bird) references bird (id_bird),
    foreign key (id_pool) references pool_type (id_pool)
);

create table lpt(
	id_lpt int primary key auto_increment,
    id_plant int,
    id_bird int,
    foreign key (id_bird) references bird (id_bird),
    foreign key (id_plant) references plant_type (id_plant)
);

create table season(
	id_season int primary key auto_increment,
    id_name int,
    id_bird int,
    foreign key (id_bird) references bird (id_bird),
    foreign key (id_name) references season_type (id_name)
);

create table meeting_time(
	id_time int primary key auto_increment,
    time_name datetime,
    id_bird int,
    foreign key (id_bird) references bird (id_bird)
);