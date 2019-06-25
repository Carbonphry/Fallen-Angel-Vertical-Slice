/// @description Insert description here
// You can write your code in this editor
if !instance_exists(o_enemy) and !instance_exists(o_enemy_portal) {
	state = 1;
} else {
	state = 2;
	/*if image_index != 0 {
		image_speed = -.5;
	}*/
	if image_index != 0 {
		image_index -=.2;
	}
	
}

if state == 2 {
	mask_index = sprite_index;
	depth = -y;
}

if state == 1 and image_index != 12 {
	
	image_speed = .5;
	depth = -y;
	//mask_index = sprite_index;
} 

if state == 1 and image_index == 12 {
	mask_index = s_noColl;
	image_speed = 0;
	depth = 950;
	
}

