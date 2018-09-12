/// @description state_create(Name <string>,Script)
/// @function state_create
/// @param Name <string> The name (key) of the state
/// @param Script the state which the key points to

// Replaces state with key Name, or makes a new one if not already present
ds_map_replace(state_map,argument[0],argument[1]);
