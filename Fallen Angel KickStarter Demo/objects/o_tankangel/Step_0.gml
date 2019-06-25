if health_ <= 0 && state_ != enemy.hit 
{
	if state_ != tankangel.die {
		state_ = tankangel.die;
		image_index = 0;
	} 
}

if o_player.state_ = player.heavy_attack
{
uninterruptible = false;
} else
{
uninterruptible = true;
}

//z_depth_system_enemy();


if state_ != noone {
	 event_user(state_);
}

//z_depth_system_enemy();
var walk_speed, jump_speed;
walk_speed = 4;
jump_speed = 4;


if jump and z = z_ground {
    z_speed = jump_speed;
	instance_create_layer(x,y,"Effects", o_jumpcloud);
	jump = false;
	//audio_play(a_player_jump);
	//add_screenshake(1.5,30);
	//alarm_set(7,global.one_second*.4);
}

//speed_ = 1;
if alarm_get(11) >0 {
	if jump {
		z_speed += 1;
	} else {
		alarm[11] = 0;
	}
}

if !levitate {

z += z_speed;
z_speed -= z_speed_gravity;


if z <= z_ground
{
    z = z_ground;
    z_speed = 0;
}
}


if !place_meeting(x, y, obj_cube_parent)
    z_ground = 0;

switch (onAir) {
	
	case false:
	move_movement_entity(true);
	var offset = sprite_height-sprite_yoffset;
	depth = -y - offset;
	break;
	
	case true:
	depth = -y-40;
	break;
	
}


if (speed_ > 0 and sprite_index == s_tankangel_idle ) {
	sprite_index = s_tankangel_move;
	image_speed = .8;
}

//apply_friction_to_movement_entity();

if (last_sprite != sprite_index) 
{
   image_index = 0;
   last_sprite = sprite_index;
}

if z != 0 {
	state_ = lancer.lifted;
	
}


