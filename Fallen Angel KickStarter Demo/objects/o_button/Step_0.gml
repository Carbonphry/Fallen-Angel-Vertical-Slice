/// @description Insert description here
// You can write your code in this editor


if place_meeting(x,y,o_player) {
	if activated_ {
		with o_puzzle_door {
			if  ( o_puzzle_1.face == 1 and o_puzzle_2.face == 0 and o_puzzle_3.face == 2 and alarm[0] <=0  ) {
				sprite_index = s_level_protodung_door_open;
				if sound_ = true {
					audio_play_priority(a_door_open);
					sound_ = false;
				}
				alarm[0] = room_speed*100;
				mask_index = s_empty;
			}
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