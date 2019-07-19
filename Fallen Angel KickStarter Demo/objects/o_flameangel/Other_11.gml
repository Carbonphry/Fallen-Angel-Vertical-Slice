/// @description Idle state
image_speed = 0.8;
sprite_index = s_flameangel_idle;
if alarm[1] <= 0 
{
	alarm[1] = random_range(2, 4) *game_get_speed(game_speed_fps);
	state_ = flameangel.wander;
	direction_ = random(360);
}

if (distance_to_object(class_player) < 30 and alarm[3]<=0)
{
		state_ = flameangel.explosion;
} else if (distance_to_object(class_player) < aggro_range_)
{
		state_ = flameangel.aggro;
}
