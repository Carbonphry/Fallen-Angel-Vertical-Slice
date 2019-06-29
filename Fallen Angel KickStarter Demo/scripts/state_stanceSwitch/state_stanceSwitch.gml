gml_pragma("forceinline");
iframe = true;
switch power_stance {
	
	case true:
	sprite_index = s_player_power_transform;
	if !audio_is_playing(a_player_transform) {
		audio_play(a_player_transform);
	}
	add_screenshake(8,6);
	break;
	
	case false:
	sprite_index = s_player_power_untransform;
	if !audio_is_playing(a_player_untransform) {
		audio_play(a_player_untransform);
	}
	break;
}
add_screenshake(8,6);
image_speed = 1;