update birds.bird 
set size = 'крупный'
where id_bird = 100;

select id_bird,
    feath_color, 
    beak_shape, 
    size, 
    tail_shape,
    pool,
    anthr_obj_distance
from bird

where id_bird = 100;
start transaction;
