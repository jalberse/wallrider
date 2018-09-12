// ENTER player_state_hit
if (place_meeting(x, y, obj_enemy) && invincible == false){
	hp--;
	update_highest_combo();
	if (hp < 1) {
		state_switch("DEAD",false);
		exit;
	}
	var inst = instance_create_layer(display_get_gui_width() - 48, 64 + hp * 36, effects_layer,obj_heart_fx);
	with (inst) {
		heart_fx_instantiate(obj_player.hp);
	}
	state_switch("HIT",false);
}