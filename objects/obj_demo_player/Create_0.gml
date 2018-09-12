/// @description
while (!place_meeting(x - 1, y, obj_wall)) x = x - 1;

// TODO; If we want this demo player to do anything more than sit here,
//       we should redo input handling of the actual player object
//       to work via commands, so we can send it AI commands
//       Right now this guy is just sitting pretty on the title screen so it's cool