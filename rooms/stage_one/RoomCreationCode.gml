var left_x = 64;
var right_x = room_width - 64;
var top_y = -768;
var bottom_y = room_height -  704
var num_blocks_high = (bottom_y - top_y) / 64;

audio_play_sound(background_music,1,1);

walls_layer = layer_get_id("walls");
// draw side walls
for (i = 0; i < num_blocks_high; i++){
	instance_create_layer(left_x,top_y + i*64,walls_layer,obj_wall);
	instance_create_layer(right_x,top_y + i*64,walls_layer,obj_wall);
}

// create ceiling
for (i = 1; i < ((right_x-left_x) / 64); i++){
	instance_create_layer(left_x + i * 128, top_y,walls_layer,obj_wall);
}

// cap bottom
for (i = 1; i < 12; i++){
	instance_create_layer(left_x - i * 128, bottom_y - 64,walls_layer,obj_wall);
	instance_create_layer(right_x + i * 128, bottom_y - 64,walls_layer,obj_wall)
}