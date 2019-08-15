/// @description Insert description here
// You can write your code in this editor
if sprite_index == s_guardcube_startactivate {
	sprite_index = s_guardcube_activated;
}


if sprite_index == s_guardcube_deactivated {
	mask_index = s_noColl;
	image_speed = 0;
	depth = 950;
	image_index = image_number-1;
}