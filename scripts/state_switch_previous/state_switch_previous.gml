/// @description state_switch_previous()
/// @function state_switch_previous
ds_stack_pop(state_stack); // discards the current state
var _state=ds_stack_top(state_stack); // get the previous state - note DOES NOT pop it
state_switch(_state,false); 
