#region Waa
/*left     = o_input.left_;
_speed_    = o_input._speed__;
up       = o_input.up_;
down     = o_input.down_;*/
//var jump     = o_input.action_four_;

var walk_speed, jump_speed;
walk_speed = 4;
jump_speed = 2;


/*if jump and z = z_ground {
    z_speed = jump_speed;
	instance_create_layer(x,y,"Effects", o_jumpcloud);
	jump = false;
	//audio_play(a_player_jump);
	//add_screenshake(1.5,30);
	//alarm_set(7,global.one_second*.4);
}

//_speed_ = 1;
/*if alarm_get(11) >0 {
	if jump {
		z_speed += 0.2;
	} else {
		alarm[11] = 0;
	}
}*/



z += z_speed;
z_speed -= z__speed_gravity;


if z <= z_ground
{
    z = z_ground;
    z_speed = 0;
}



if !place_meeting(x, y, obj_cube_parent)
    z_ground = 0;
	
#endregion