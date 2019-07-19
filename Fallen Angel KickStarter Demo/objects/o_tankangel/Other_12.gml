/// @description Wander Event
image_speed = .8;
sprite_index = s_tankangel_move;
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
} else 
{
	add_movement_maxspeed(direction_, 0.05, .5);
}

move_movement_entity(true);

//move_movement_entity(true);

if _speed_ == 0
{
	alarm[1] = random_range(1,3) * game_get_speed(game_speed_fps);
	state_ = tankangel.idle;
}
var target = instance_nearest(x,y,class_player);
if (distance_to_object(target) < aggro_range_) and (global.player_health >0)
{
		state_ = tankangel.aggro;
} 