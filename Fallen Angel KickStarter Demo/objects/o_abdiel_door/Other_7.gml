/// @description Insert description here
// You can write your code in this editor
if sprite_index == s_door_appear {
	sprite_index = s_door_open;
	exit;
}

if sprite_index == s_door_open {
	image_speed = 0;
	image_index = image_number-1;
	
}



