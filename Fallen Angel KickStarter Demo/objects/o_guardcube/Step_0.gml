/// @description Insert description here
// You can write your code in this editor
if !instance_exists(o_enemy) and !instance_exists(o_enemy_portal) {
	state = 1;
		sprite_index = s_guardcube_deactivated;
} else {
	state = 2;
	sprite_index = s_guardcube_activated;
	/*if image_index != 0 {
		image_speed = -.5;
	}*/

}

if state == 2 {
	mask_index = sprite_index;
	image_speed = .8;
	depth = -y;
}

if state == 1 and image_index != 11 {
	
	image_speed = .8;
	depth = -y;
	//mask_index = sprite_index;
} 

if state == 1 and image_index == 11 {
	mask_index = s_noColl;
	image_speed = 0;
	depth = 950;
	
}

