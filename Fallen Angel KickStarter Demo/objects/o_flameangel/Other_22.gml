/// @description Executed
// You can write your code in this editor
image_speed = .8;
sprite_index = s_flameangel_executed;

x_ = (x+ random_range(-12,12));
y_ = (y+ random_range(-12,12));

if animation_hit_frame(4)
{
	create_animation_effect(s_red_sparks_effect,x_,y_,0.8,true)
	if !audio_is_playing(a_player_execution) 
	{
	audio_play(a_player_execution);
	}
		
}

if animation_hit_frame(8)
{
	create_animation_effect(s_red_explosion_effect,x,y,0.8,true)
	add_screenshake(12,20);
}

if animation_hit_frame(10)
{
	create_animation_effect(s_red_sparks_effect,x_,y_-10,0.8,true)
}

		