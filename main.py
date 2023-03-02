import mysql.connector as connector
from random import choice, randint
import data
import sys

try:
    con = connector.connect(user='root',
                            password='kb2002kb',
                            host='127.0.0.1',
                            database='birds'
                            )
    print('Connection complete!')
except connector.Error as err:
    print('Something went wrong: ', err)
    sys.exit()

cur = con.cursor(buffered=True)

if data.create_data:
    # order = 1
    for i in range(data.numb_birdwatchers):
        cur.execute('INSERT INTO birdwatcher (last_name, first_name, fathers_name) VALUES (%s, %s, %s)',
                    (choice(data.last_names), choice(data.first_names), choice(data.father_names)))
    for i in range(data.numb_books):
        cur.execute('INSERT INTO book (author, species_desc, pub_info) VALUES (%s, %s, %s)',
                    (choice(data.last_names) + ' ' + choice(data.first_names) + ' ' + choice(data.father_names),
                     data.generate_description(32), choice(data.pub_infos)))
    for i in range(data.numb_season_types):
        cur.execute("INSERT INTO season_type (season_name) VALUES ('" + data.season_types[i] + "')")
    for i in range(data.numb_pools):
        cur.execute("INSERT INTO pool_type (pooltype) VALUES ('" + data.pool_types[i] + "')")
    for i in range(data.numb_plants):
        cur.execute("INSERT INTO plant_type (planttype) VALUES ('" + data.plant_types[i] + "')")
    for i in range(data.numb_anthr_obj):
        cur.execute("INSERT INTO anthr_obj_type (objtype) VALUES ('" + data.anthr_obj_types[i] + "')")
    print('Order 1 completed')

    # order = 2
    cur.execute('SELECT * FROM book WHERE id_book > 0')
    books = cur.fetchall()
    distr = data.randNums(data.numb_books, 1, 10, data.numb_species)
    for i in range(data.numb_books):
        for j in range(distr[i]):
            cur.execute('INSERT INTO species (latin_name, russian_name, area, id_book) VALUES (%s, %s, %s, ' +
                        str(books[i][0]) + ')',
                        (data.generate_sp_name('eng'), data.generate_sp_name('rus'), data.generate_path()))
    print('Species completed')
    cur.execute('SELECT * FROM species WHERE id_species > 0')
    species = cur.fetchall()
    distr = data.randNums(data.numb_species, 1, 2000, data.numb_birds)
    print('Distr completed')
    for i in range(data.numb_species):
        for j in range(distr[i]):
            cur.execute('INSERT INTO bird (feath_color, beak_shape, size, tail_shape, '
                        'pool, anthr_obj_distance, id_species, id_birdwatcher) VALUES (%s, %s, %s, %s, ' +
                        str(randint(0, 1)) + ', %s, ' + str(species[i][0]) + ', ' +
                        str(randint(1, data.numb_birdwatchers)) + ')',
                        (choice(data.feather_colors), choice(data.beak_shapes), choice(data.sizes),
                         choice(data.tail_shapes), choice(data.anthr_obj_distances)))
    print('Order 2 completed')

    # order = 3
    for i in range(data.numb_species):
        cur.execute("INSERT INTO species_song (species_file, purpose, id_species) VALUES ('" +
                    data.generate_path() + "', %s, %s)", (choice(data.purposes), str(species[i][0])))
        cur.execute("INSERT INTO species_photo (species_file, id_species) VALUES ('" + data.generate_path() + "', " +
                    str(species[i][0]) + ')')

    cur.execute('SELECT * FROM bird')
    distr_songs = data.randNums(data.numb_birds, 1, data.numb_bird_songs, -1)
    distr_photos = data.randNums(data.numb_birds, 1, data.numb_bird_photos, -1)
    distr_plant_links = data.randNums(data.numb_birds, 1, data.numb_lpt, -1)
    distr_pool_links = data.randNums(data.numb_birds, 1, data.numb_lpl, -1)
    distr_antr_links = data.randNums(data.numb_birds, 1, data.numb_lpa, -1)
    birds = cur.fetchall()
    print('All distr completed')
    for i in range(data.numb_birds):
        bird = str(birds[i][0])
        cur.execute('SELECT * FROM season_type')
        seasons = cur.fetchall()
        cur.execute('INSERT INTO season (id_bird, id_name) VALUES ('  + bird  + ", '" + str(choice(seasons[:4])[0]) + "')")
        cur.execute("INSERT INTO meeting_time (time_name, id_bird) VALUES ('" + str(data.generate_time()) + "', " +
                    bird + ')')
        for j in range(distr_songs[i]):
            cur.execute("INSERT INTO bird_song (bird_file, purpose, id_bird) VALUES ('" +
                        data.generate_path() + "'   , %s, %s)", (choice(data.purposes), bird))
        for j in range(distr_photos[i]):
            cur.execute("INSERT INTO bird_photo (bird_file, id_bird) VALUES ('" + data.generate_path() + "', " +
                        bird + ')')
        for j in range(distr_plant_links[i]):
            cur.execute('SELECT * FROM plant_type WHERE id_plant > 0')
            plants = cur.fetchall()
            cur.execute('INSERT INTO lpt (id_plant, id_bird) VALUES (' +
                        str(choice(plants)[0]) + ", '" + bird + "')")
        for j in range(distr_pool_links[i]):
            cur.execute('SELECT * FROM pool_type WHERE id_pool > 0')
            pools = cur.fetchall()
            cur.execute('INSERT INTO lpl (id_pool, id_bird) VALUES (' +
                        str(choice(pools)[0]) + ", '" + bird + "')")
        for j in range(distr_antr_links[i]):
            cur.execute('SELECT * FROM anthr_obj_type WHERE id_obj > 0')
            objects = cur.fetchall()
            cur.execute('INSERT INTO la (id_obj, id_bird) VALUES (' +
                        str(choice(objects)[0]) + ", '" + bird + "')")
    print('Order 3 completed')

con.commit()
cur.close()
con.close()

