/// @description
if (global.pause == 1) exit;
event_inherited(); // handles collision

// handle motion
if (range > abs(x_start - x) + abs(y_start - y)) {
	yv = yv + ya; // slows down bullet
	y = y + yv;
	x += xv;
	if ( timer % 8 == 0) instance_create_layer(x,y,effects,obj_pea_tracer);
}
else instance_destroy();