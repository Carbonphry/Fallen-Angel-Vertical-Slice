/// @description Stun
// You can write your code in this editor
sprite_index = s_flameangel_getup;
image_speed = .5;
_speed_ = 0;

if animation_hit_frame(0) {
	var ef = create_animation_effect(s_red_sparks_effect,x,y-10,0.8,true);
	ef.depth = depth-1;
	if !audio_is_playing(a_player_parried) {
		audio_play(a_player_parried);					
	}
}
