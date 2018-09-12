/// @description 

// Flips image if on right wall
if (x > room_width / 2) image_xscale = -1;

// If above ground level or outside the level, be an invisible wall
if (y < 764 && room == stage_one) image_alpha = 0;
if (x < 0 || x > room_width) image_alpha = 0;