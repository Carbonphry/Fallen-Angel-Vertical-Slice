/// @description Aggro State
image_speed = .8;
sprite_index = s_tankangel_move;
var target = instance_nearest(x,y,class_player);
direction_ = point_direction(x, y, target.x, target.y);
var _x_speed = lengthdir_x(_speed_, direction_);
if _x_speed != 0
{
		image_xscale = sign(_x_speed);
}
var target = instance_nearest(x,y,class_player);
if place_meeting(x,y,o_solid) and distance_to_object(target) < 120 {
	state_ = tankangel.jump;
}

if alarm[1] <= 0
{
		apply_friction_to_movement_entity();
} 
else
{
	//add_movement_maxspeed(direction_, 0.001, 0.0001);
	mp_potential_step_object(target.x,target.y, .6, class_enemy_coll);
}

//move_movement_entity(true);

if _speed_ == 0
{
	alarm[1] = random_range(1, 2) * global.one_second;
	state_ = tankangel.idle;
}

if (global.player_health>0)
{
	tankangel_attack();
} else
{
	state_ = tankangel.wander;
}

