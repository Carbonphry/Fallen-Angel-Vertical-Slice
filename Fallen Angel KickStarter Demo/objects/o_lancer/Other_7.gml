if (sprite_index = s_lancerangel_die)
{
	instance_destroy(id,true);
}


if sprite_index == s_lancerangel_getup {
	state_ = starting_state_;
}

if sprite_index == s_lancerangel_stun {
	state_ = starting_state_;
	o_player.cannot_move = false;
}

if sprite_index == s_lancerangel_parry {
	state_ = starting_state_;
}

if sprite_index == s_lancerangel_executed {
	instance_destroy(id,true);
}