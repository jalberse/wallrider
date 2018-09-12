// This is just state_update, but because of how we are allowing repeated states in spawner's machine,
// We need a different method
if (switching) {
	state = state_next;
	state_timer = 0;
	state_new=true;
}
else
{
  state_timer++;
  state_new=false;
}