// To be called at the end of step,
// Switches between states or increments state_timer (and gets us out of state_new)
if(state_next != state)
{
  state=state_next;
  state_timer=0;
  state_new=true;
}
else
{
  state_timer++;
  state_new=false;
}

