/// @description
event_inherited();

effects = layer_get_id("effects");

y_start = obj_player.y;
x_start = obj_player.x;
range = 256; 
yv = 10;
xv = 0;
ya = -.2;
timer = 0;

audio_play_sound(pew,2,0);
audio_sound_pitch(pew,1.5 + instance_number(obj_pea) / 30);

// TODO: Make bullets all children of a single object
//       so enemies can just check against obj_bullet to die

// NOTE: If we make ya large enough so that we do no reach range, we can
//       make a bullet which goes down then back up. Potentially VERY fun!
//       Try it out with a different gun.