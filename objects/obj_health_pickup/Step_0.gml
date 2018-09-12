/// @description 
if (global.pause == 1) exit;
// get hit by a melee attack, increment health and go away
if (place_meeting(x,y,obj_melee)){
	with (instance_nearest(x, y, obj_player)){
		if (hp < hp_max) hp++;
	}
	instance_destroy();
}