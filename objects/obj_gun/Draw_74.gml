// @description

// Draw the ammo
var shake = 0;
if (ammo == 0) shake = 1
draw_sprite(spr_ammo_box, 0, x + random(shake), y + random(shake));
draw_set_halign(fa_center);
draw_text(x + random(shake), y - 16 + random(shake), string(ammo));

for (i = 0; i < ammo_max; i++) {
	var offset = floor((i / 3) * 64) - floor(i / 3) * 7;
	if (i % 3 == 0) draw_sprite(spr_ammo_0,0,x,y + 58 + offset);
	if (i % 3 == 1) draw_sprite(spr_ammo_1,0,x,y + 38 + offset);
	if (i % 3 == 2) draw_sprite(spr_ammo_2,0,x,y + 19 + offset);
}
for (i = 0; i < ammo; i++) {
	var offset = floor((i / 3) * 64) - floor(i / 3) * 7;
	if (i % 3 == 0) draw_sprite(spr_ammo_0,1,x,y + 58 + offset);
	if (i % 3 == 1) draw_sprite(spr_ammo_1,1,x,y + 38 + offset);
	if (i % 3 == 2) draw_sprite(spr_ammo_2,1,x,y + 19 + offset);
}