//@description Handles assigment of sprite. Must be called anytime a player tracer is initiated
//param image_number 1-3 for player air states, 4 for fire
switch (argument0) {
	case 1: sprite_index = spr_player_air_one_tracer; break;
	case 2: sprite_index = spr_player_air_two_tracer; break;
	case 3: sprite_index = spr_player_air_three_tracer; break;
	case 4: sprite_index = spr_player_fire_tracer; break;
	default: sprite_index = spr_player_air_one_tracer; break;
}