//@description instantiates movement and sprite variables based on hp
//@param hp_index the hp the fx is for
hp_index = argument0;
image_speed = 0;
image_index = 1;
var xv_magnitude = 5;
var xa_magnitude = .2;
yv = 0;
switch (hp_index % 6) {
	case 0:
	{
		// HEART ZERO ORIGINAL
		sprite_index = spr_heart_0;
		xv = -xv_magnitude;
		xa = xa_magnitude;
		yv = 1.5;
		break;
	}
	case 1:
	{
		// HEART ONE ORIGINAL
		sprite_index = spr_heart_1;
		xv = xv_magnitude;
		xa = -xa_magnitude;
		yv = 1.5;
		break;
	}
	case 2:
	{
		// HEART TWO ORIGINAL
		sprite_index = spr_heart_2;
		xv = -xv_magnitude;
		xa = xa_magnitude;
		yv = -1;
		break;
	}
	case 3:
	{
		// HEART ZERO FLIP
		sprite_index = spr_heart_0;
		image_xscale = -1;
		xv = xv_magnitude;
		xa = -xa_magnitude;
		yv = 1.5;
		break;
	}
	case 4:
	{
		// HEART ONE FLIP
		sprite_index = spr_heart_1;
		image_xscale = -1;
		xv = -xv_magnitude;
		xa = xa_magnitude;
		yv = 1.5;
		break;
	}
	case 5:
	{
		// HEART TWO FLIP
		sprite_index = spr_heart_2;
		image_xscale = -1;
		xv = xv_magnitude;
		xa = -xa_magnitude;
		yv = -1;
		break;
	}
	default: break;
}