/// @description Idle state
image_speed = 0.6;
sprite_index = s_missileangel_idle;

if (distance_to_object(class_player) < aggro_range_ and alarm[1] <=0)
{
		state_ = missangel.attack;
}
