/// @description Insert description here
// You can write your code in this editor
if sprite_index == spr_cube_appear and ( alarm_get(0) > 0 ) {
	sprite_index = spr_cube_small;
	if place_meeting(x,y,class_player) {
		o_player.z = height+60;
		o_player.z_ground = height;
	}
}