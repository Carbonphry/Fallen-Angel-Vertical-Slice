if distance_to_object(o_player) < 80
{
	image_alpha += 0.01
}


if distance_to_object(o_tp_projectile) < 40
{
	sprite_index = s_tutorial_teleport_now;
	image_speed = 0.8;
	if (global.gamepad_active )
	{
		sprite_index = s_tutorial_teleport_now_gpad;
	}
	
} else
{
	sprite_index = s_tutorial_teleport;
	image_speed = 0.2
	
	switch (global.gamepad_active) {

	case true:
	sprite_index = s_tutorial_teleport_gpad;
	break;
	
	case false:
	sprite_index = s_tutorial_teleport;
	break;

}

	
	
}


if image_alpha >= 0.8
{
	image_alpha = 0.8
}