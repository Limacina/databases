/*
Запрос 5.
Найти те книги, для которых не было встречено ни одной птицы.
*/

use birds;


select author, pub_info, cnt_species, count(bird.id_bird) as cnt_birds
from(
	select book.author as author, book.pub_info as pub_info, species.id_species as id_species, book.id_book as id_book, count(species.id_species) as cnt_species
	from book
	inner join species on species.id_book=book.id_book
	group by book.id_book) tmp_table
inner join bird on tmp_table.id_species=bird.id_species
group by tmp_table.id_book
having cnt_birds<1000;

