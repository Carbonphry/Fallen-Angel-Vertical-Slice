/// @description Wander Event
image_speed = .6;
sprite_index = s_lancerangel_move;
var _x_speed = lengthdir_x(_speed_, direction_);
if _x_speed != 0
{
		image_xscale = sign(_x_speed);
}

if alarm[1] <= 0
{
	apply_friction_to_movement_entity();
} else 
{
	add_movement_maxspeed(direction_, 0.04, .3);
	
}

move_movement_entity(true);

if _speed_ == 0
{
	alarm[1] = random_range(1,3) * game_get_speed(game_speed_fps);
	state_ = choose (lancer.idle,lancer.aggro);
}

if (distance_to_object(o_player) < aggro_range_) and (global.player_health >0)
{
		state_ = lancer.aggro;
} 