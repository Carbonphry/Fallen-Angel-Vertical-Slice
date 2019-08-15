if (sprite_index = s_tankangel_die)
{
	instance_destroy(id,true);
}

if (sprite_index = s_tankangel_attack)
{
	state_ = tankangel.idle;
	alarm[1] = 2*global.one_second;
}

if sprite_index == s_tankangel_getup {
	state_ = starting_state_;
}

if sprite_index == s_tankangel_stun {
	state_ = starting_state_;
	o_player.cannot_move = false;
}

if sprite_index == s_tankangel_executed {
	instance_destroy(id,true);
}