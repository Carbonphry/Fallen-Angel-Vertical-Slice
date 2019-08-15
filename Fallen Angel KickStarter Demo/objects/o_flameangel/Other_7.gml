if (sprite_index = s_flameangel_die)
{
	instance_destroy();
}

if sprite_index == s_flameangel_getup {
	state_ = starting_state_;
	o_player.cannot_move = false;
}

if sprite_index == s_flameangel_executed {
	instance_destroy(id,true);
}