if state_ = cherub.die
{
	instance_destroy();
}

if sprite_index == s_caveman_getup {
	state_ = starting_state_;
}

if sprite_index == s_caveman_stunned {
	state_ = starting_state_;
	o_player.cannot_move = false;
}