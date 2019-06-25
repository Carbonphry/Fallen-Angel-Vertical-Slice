/// @description Insert description here
// You can write your code in this editor

switch (global.puzzle_state_) {

case 0:

if alarm[0] < 0 {
image_speed = .4;
switch (facenu) {

	case 0:
	sprite_index = s_level_protodung_puzzle_1;
	break;
	
	case 1:
	sprite_index = s_level_protodung_puzzle_2;
	break;
	
	case 2:
	sprite_index = s_level_protodung_puzzle_3;
	break;

}
}
break;

case 1:
sprite_index = s_level_protodung_puzzle_deactivated;
break;

}

if (last_sprite != sprite_index) {
   image_index = 0;
   last_sprite = sprite_index;
}

speed = 0;