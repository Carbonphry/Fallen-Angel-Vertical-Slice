/// @description Idle state
image_speed = 0.2;
sprite_index = s_tankangel_idle;
var _x_speed = lengthdir_x(_speed_, direction_);
if _x_speed != 0
{
		image_xscale = sign(_x_speed);
}


if alarm[1] <= 0 
{
	alarm[1] = random_range(2, 4) *game_get_speed(game_speed_fps);
	state_ = tankangel.wander;
	randomize();
	direction_ = irandom(360);
}
var jump_range = 40;
var target = instance_nearest(x,y,class_player);
if (distance_to_object(target) < aggro_range_+jump_range and distance_to_object(target) > aggro_range_ and (alarm[3] <=0) ) {
	
	_speed_ = 0;
	state_ = tankangel.jump;
} else if (distance_to_object(target) < aggro_range_ and alarm[1] <=0 )
{
		state_ = tankangel.aggro;
		//alarm[3] = 100;
}

