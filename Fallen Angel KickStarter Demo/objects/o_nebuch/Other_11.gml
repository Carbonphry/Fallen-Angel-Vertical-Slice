/// @description Idle state
image_speed = 0.6;
sprite_index = s_nebuch_idle;
if alarm[1] <= 0 
{
	alarm[1] = random_range(2, 4) *game_get_speed(60);
	direction_ = random(360);
	state_ = cherub.wander;
}

if (distance_to_object(o_player) < aggro_range_ and alarm[2] <= 0 and global.player_health >0 )
{
		state_ = cherub.aggro;
}
