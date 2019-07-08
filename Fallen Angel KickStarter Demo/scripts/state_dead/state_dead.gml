/// @description Dead State
//if (image_index == 0 ) then image_speed = 0.2;
image_speed = 0.4;

global.player_health = 0;
if !instance_exists(o_fade_death) {
	instance_create_depth(-500,0,-9998,o_fade_death); 
}

if animation_hit_frame(11) {
	image_speed = 0;
}

