/// @description Insert description here
// You can write your code in this editor
if sprite_index == s_door_appear {
	sprite_index = s_door_open;
	o_player.state_ = o_player.starting_state_;
}

instance_destroy(id,true);



