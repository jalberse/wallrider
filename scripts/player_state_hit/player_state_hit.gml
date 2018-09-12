if (state_new){
	yv = -8;
	invincible = true;
	state_var[0] = 5;
	sprite_index = spr_player_hit;
}

// KINEMATICS
var dir = right_held - left_held; // direction of horizontal movement
if (abs(xv + (xa * dir)) < xv_max) xv = xv + (xa * dir);
if (place_meeting(x + xv, y, obj_wall)){
	while (!place_meeting(x + sign(xv), y, obj_wall)) x = x + sign(xv);
}
else x = x + xv;
if (yv >= 0) yv = yv + grv * down_grv_factor;
else yv = yv + grv;
if (place_meeting(x, y + yv, obj_wall)){
	while (!place_meeting(x, y + sign(yv), obj_wall)) {
		y = y + sign(yv); 
	}
}
else {
	y = y + yv;
}

if (state_timer % state_var[0] == 0 && image_alpha == 1) image_alpha = 0;
else if (state_timer % state_var[0] == 0) image_alpha = 1;

// STATE SWITCHES
if (state_timer >= iframes) {
	image_angle = 0;
	image_alpha = 1;
	invincible = false;
	if (place_meeting(x+5,y,obj_wall) || place_meeting(x-5,y,obj_wall)){
		state_switch("WALLRIDE",false);
	}
	else state_switch("AIR",false);
}

