/// @description
lifespan = 300
timer = 0;
value = 20; // point value
chase_player = false;
xv = random_range(-5,5);
yv = random_range(-10,-5);
x += random_range(-8,8); 
y += random_range(-8,8);
grv = .15;

effects_layer = layer_get_id("effects")