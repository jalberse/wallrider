/// @description
if (global.pause == 1) exit;
// Got past player, past screen
if (y < -50){
	with (obj_player) {
		hp--;
		update_highest_combo()
		if (hp < 1) {
			state_switch("DEAD",false);
		}
		else {
			var inst = instance_create_layer(display_get_gui_width() - 48, 64 + hp * 36, effects_layer,obj_heart_fx);
			with (inst) {
				heart_fx_instantiate(obj_player.hp);
			}
		}
	}
	instance_destroy();
}
// Execute AI Component (motion)
script_execute(ai_component);