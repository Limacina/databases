import string
import random
from datetime import datetime, timedelta
import rstr

def randNums(n,a,b,s):
    if s == -1:
        count = 0
        nums = []
        while count < n:
            r = random.randint(a, b)
            count += 1
            nums.append(r)
    else:
        #finds n random ints in [a,b] with sum of s
        while True:
            total, count = 0,0
            nums = []
            while total < s and count < n:
                r = random.randint(a,b)
                total += r
                count += 1
                nums.append(r)
            if total == s and count == n: break
    return nums


create_data = False

# order = 1
numb_birdwatchers = 50
numb_season_types = 5
numb_books = 25
numb_pools = 5
numb_plants = 5
numb_anthr_obj = 4

# order = 2
numb_species = 100
numb_birds = 100000

#order = 3
numb_sp_songs = 100
numb_sp_photos = 100
numb_bird_songs = 3
numb_bird_photos = 2
numb_lpt = 5
numb_lpl = 5
numb_lpa = 5

season_types = ['лето', 'осень', 'зима', 'весна', 'летосень']
feather_colors = ['красный', 'зелёный', 'оранжевый', 'белый', 'чёрный',
                  'коричневый', 'малиновый', 'голубой', 'фиолетовый', 'розовый',
                  'синий', 'жёлтый', 'серый', 'оливковый', 'охра', 'вишневый',
                  'темно-оранжевый', 'бордовый', 'лазурный', 'индиго']
beak_shapes = ['острый', 'плоский', 'крючковидный', 'загнутый вниз',
               'тонкий', 'толстый', 'загнутый вверх', 'долото',
               'кинжал', 'шипцы', 'широкий', 'узкий', 'зазубренный']
sizes = ['крупный', 'средний', 'мелкий']
tail_shapes = ['клиновидный', 'короткий', 'длинный', 'острый',
               'U-образный', 'раздвоенный', 'овальный', 'плоский']
anthr_obj_distances = ['внутри населенного пункта', 'рядом с населенным пунктом', 'ненаселенная территория']
anthr_obj_types = ['крупный город', 'деревня', 'сельская местность', 'пгт']
purposes = ['перекличка', 'сигнал тревоги', 'подражание', 'дуэтное', 'охранная', 'брачная']
# descriptions
pub_infos = ['Беркут', 'Орнитология', 'The Russian Journal of Ornithology. Официальный сайт — http://www.ornis.su',
             'Пернатые хищники и их охрана — Raptors Conservation', 'Acta Ornithologica',
             'Alauda', 'Alula', 'Ardea', 'Avian Science', 'Avicultural Magazine',
             'Aquila', 'Bird Study', 'Birding Scotland', 'Bulletin of the British Ornithologists',
             'Central European Journal of Biology', 'Cotinga', 'Der Falke', 'Ibis — British Ornithologists Union',
             'Journal of Avian Biology', 'Journal of Ornithology', 'Neotropical Birding', 'Ornis Fennica',
             'Ornithologische Mitteilungen', 'Ornithos', 'Die Vogelwelt', 'Dutch Birding']
first_names = ['Александр', 'Григорий', 'Лев', 'Андрей', 'Роман', 'Арсений', 'Степан',
               'Владислав', 'Никита', 'Глеб', 'Марк', 'Давид', 'Ярослав', 'Евгений',
               'Матвей', 'Фёдор', 'Николай', 'Алексей', 'Андрей', 'Артемий', 'Виктор',
               'Никита', 'Даниил', 'Денис', 'Егор', 'Игорь', 'Лев', 'Леонид', 'Павел']
last_names = ['Смирнов', 'Иванов', 'Кузнецов', 'Соколов', 'Попов', 'Лебедев',
              'Козлов', 'Новиков', 'Морозов', 'Петров', 'Волков', 'Соловьёв',
              'Васильев', 'Зайцев', 'Павлов', 'Семёнов', 'Голубев', 'Виноградов',
              'Богданов', 'Воробьёв', 'Фёдоров', 'Михайлов', 'Беляев', 'Тарасов']
father_names = ['Александрович', 'Алексеевич', 'Анатольевич', 'Андреевич', 'Антонович',
                'Аркадьевич', 'Артемович', 'Бедросович', 'Богданович', 'Борисович',
                'Валентинович', 'Валерьевич', 'Васильевич', 'Викторович', 'Витальевич',
                'Владимирович', 'Владиславович', 'Вольфович', 'Вячеславович', 'Геннадиевич',
                'Георгиевич', 'Григорьевич', 'Данилович', 'Денисович', 'Дмитриевич']
seasons = ['Лето', 'Зима', 'Осень', 'Весна']
pool_types = ['озеро', 'море', 'река', 'пруд', 'ручей']
plant_types = ['хвойный лес', 'лиственный лес', 'болото', 'пойма', 'вырубка']

def generate_description(length):
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))


def generate_sp_name(lang):
    if lang == 'eng':
        letters = string.ascii_lowercase
        return random.choice(letters).upper() + \
               ''.join(random.choice(letters) for i in range(10)) + ' ' + \
               ''.join(random.choice(letters) for i in range(10))
    else:
        return rstr.xeger(r'[А-Я][а-я]{10}')


def generate_path():
    return 'C:/Users/Admin/' + generate_description(10)


def generate_time(min_year=1900, max_year=datetime.now().year):
    start = datetime(min_year, 1, 1, 00, 00, 00)
    years = max_year - min_year + 1
    end = start + timedelta(days=365 * years)
    return start + (end - start) * random.random()