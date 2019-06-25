/// @description Insert description here
// You can write your code in this editor
if place_meeting(x,y,o_player) {
	if activated_ {
		if state == 0 {
			state = 1;
			activated_ = false;
		} else if state == 1 {
			state = 2;
			activated_ = false;
		} else if state == 2 {
			state = 1;
			activated_ = false;
		}

	} 

if image_index == 2 {
	image_speed = 0;
} else {
	image_speed = 0.3;
	}
} else {
	image_speed = 0;
	image_index = 0;
}

y= o_room6_plat.y;