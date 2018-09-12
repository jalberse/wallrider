//@description draws hearts
//@param isFull if the hearts are to be full or not
//@param num the number of hearts to draw
//@param y_base the y location to begin drawing from
//@param x_base the x location to begin drawing from
var isFull = argument0;
var num = argument1;
var y_base = argument2;
var x_base = argument3;
var offset;
for (i = 0; i < num; i++) {
	offset = i * 36;
	switch (i % 6)
	{
		case 0:
		{
			// HEART ZERO ORIGINAL
			draw_sprite(spr_heart_0,isFull,x_base, y_base + offset);
			break;
		}
		case 1:
		{
			// HEART ONE ORIGINAL
			if (isFull) draw_sprite(spr_heart_1,isFull,x_base, y_base + offset);
			else if (i == hp_max - 1) draw_sprite(spr_heart_1,2,x_base, y_base + offset);
			else draw_sprite(spr_heart_1,isFull,x_base, y_base + offset);
			break;
		}
		case 2:
		{
			// HEART TWO ORIGINAL
			draw_sprite(spr_heart_2,isFull,x_base, y_base + offset);
			break;
		}
		case 3:
		{
			// HEART ZERO FLIPPED
			draw_sprite_ext(spr_heart_0,isFull,x_base, y_base + offset,-1,1,0,c_white,1);
			break;
		}
		case 4: 
		{
			// HEART ONE FLIPPED
			if (isFull) draw_sprite_ext(spr_heart_1,isFull,x_base, y_base + offset,-1,1,0,c_white,1);
			else if (i == hp_max - 1) draw_sprite_ext(spr_heart_1,2,x_base, y_base + offset,-1,1,0,c_white,1);
			else draw_sprite_ext(spr_heart_1,isFull,x_base, y_base + offset,-1,1,0,c_white,1);
			break;
		}
		case 5: 
		{
			// HEART TWO FLIPPED
			draw_sprite_ext(spr_heart_2,isFull,x_base, y_base + offset,-1,1,0,c_white,1);
			break;
		}
		default: break;
	}
}