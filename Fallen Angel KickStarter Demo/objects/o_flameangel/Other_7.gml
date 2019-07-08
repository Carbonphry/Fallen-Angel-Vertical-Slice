if (sprite_index = s_flameangel_die)
{
	instance_destroy();
}

if sprite_index == s_flameangel_getup {
	state_ = starting_state_;
}

if sprite_index == s_flameangel_executed {
	instance_destroy(id,true);
}