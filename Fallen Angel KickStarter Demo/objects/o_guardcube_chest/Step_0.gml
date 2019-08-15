/// @description Insert description here
// You can write your code in this editor
if !instance_exists(o_enemy) and !instance_exists(o_enemy_portal) and !instance_exists(o_chest) {
	state = 1;
	sprite_index = s_guardcube_deactivated;
} else {
	if state != 2 {
		state = 2;
		image_index = 0;
	}
}

if state == 2 and sprite_index != s_guardcube_activated  {
	sprite_index = s_guardcube_startactivate
	mask_index = sprite_index;
	image_speed = .8;
	depth = -y;
}

if sprite_index == s_guardcube_activated then image_speed = .7;

if state == 1 and image_index != image_number-1 {
	image_speed = .8;
	depth = -y;
	if !audio_is_playing(a_guardcube_release) {
		audio_play(a_guardcube_release);
	}
	//mask_index = sprite_index;
} 



