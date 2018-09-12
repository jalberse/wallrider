/// @description state_init(state);
/// @function state_init
/// @param state <string> The NAME of the state, eg "AIR"
// Sets the default state for an object.  Called only in the create event of that object.

state=ds_map_find_value(state_map,argument[0]);
state_name=argument[0];
state_next=state;
ds_stack_push(state_stack,state); // Stack should now have 1 element: the default state
state_new=true;