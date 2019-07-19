/// @description Wander Event
image_speed = .8;
sprite_index = s_abdiel_idle;
if instance_exists(class_player) {
	target = instance_nearest(x,y,class_player);
	direction_ = point_direction(x, y, target.x, target.y);
}
var _x_speed = lengthdir_x(_speed_, direction_);
if _x_speed != 0 and alarm[6] <= 0
{
		image_xscale = sign(_x_speed);
		alarm[6] = global.one_second*.4;
}

if alarm[1] <= 0
{
	apply_friction_to_movement_entity();
} else 
{
	add_movement_maxspeed(direction_, 0.09, .5);
}

move_movement_entity(true);

if _speed_ == 0 {
	alarm[1] = random_range(1,1.5) * game_get_speed(game_speed_fps);
	state_ = abdiel.idle;
}
var target = instance_nearest(x,y,class_player);
if (distance_to_object(target) < aggro_range_) and (global.player_health >0) and alarm[2] <= 0 {
		state_ = abdiel.aggro;
} else if (distance_to_object(target) > aggro_range_) and (global.player_health >0) and alarm[3] <= 0 {
		state_ = abdiel.projectile;
} 