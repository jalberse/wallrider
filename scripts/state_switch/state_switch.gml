/// @description state_switch(state <script or name>,<push to stack?>)
/// @function state_switch
/// @param state <script or name>
/// @param <push to stack?>

var _push = true; // We push by default
if (argument_count > 1) {
	_push = argument[1]; // We must be able to push, eg if we want to switch to go back a state
}
//if (state_next == argument[0]) {}// Do nothing, this is already the next state
//else {
	if(ds_map_exists(state_map,argument[0]))
	{
		state_next=ds_map_find_value(state_map,argument[0]);
		state_name=argument[0]; 
	}
	else
	{
		show_debug_message("Tried to switch to a non-existent state.  Moving to first state.")
		state_next=ds_map_find_first(state_map);
		state_name="Unknown (Tried to switch to a non-existant state)";
	}
	if(_push) ds_stack_push(state_stack, state_next);
//}
