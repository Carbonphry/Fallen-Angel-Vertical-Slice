/// @description Insert description here
// You can write your code in this editor
/*if ( ( o_puzzle_1.face == 1 and o_puzzle_2.face == 0 and o_puzzle_3.face == 2 and alarm[0] <=0  ) and point_distance(x,y,o_player.x,o_player.y) <= 30 ) //or keyboard_check(vk_f1) and alarm[0] <=0 
//if keyboard_check(vk_f1) and alarm[0] <=0  DEBUG
{
	sprite_index = s_level_protodung_door_open;
	if sound_ = true
	{
		audio_play_priority(a_door_open);
		sound_ = false;
	}
	alarm[0] = room_speed*100;
	mask_index = s_empty;
}
//image_index = 5;

