/// @description Insert description here
// You can write your code in this editor
if !instance_exists(o_enemy) and !instance_exists(o_enemy_portal) {
	state = 1;
	sprite_index = s_guardcube_deactivated;
} else {
	state = 2;
}

if state == 2 and sprite_index == s_guardcube_startactivate {
	mask_index = sprite_index;
	image_speed = .8;
	depth = -y;
}

if sprite_index == s_guardcube_activated then image_speed = .7;

if state == 1 and image_index != image_number-1 {
	image_speed = .8;
	depth = -y;
	//mask_index = sprite_index;
} 


