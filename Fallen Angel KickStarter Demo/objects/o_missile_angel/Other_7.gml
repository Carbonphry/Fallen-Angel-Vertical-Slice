if (sprite_index = s_missileangel_die)
{
	instance_destroy();
}

if (sprite_index = s_missileangel_attack)
{
	state_ = missangel.idle;
	//state_ = choose (flameangel.wander, flameangel.run);
	attacked_ = true;
	alarm[1] = 1.5*global.one_second;
}