/// @description Die State
image_speed = .8;
sprite_index = s_missileangel_die;
speed_ = 0;
if (die_sound = false)
{
	audio_play_sound(a_enemy_die, 7, false);
	die_sound = true;
}	

