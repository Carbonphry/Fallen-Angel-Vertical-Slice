image_speed = .53;
iframe = true;
switch power_stance {
	case false:
	sprite_[player.execute, dir.right] = s_player_execute;
	sprite_[player.execute, dir.up] = s_player_execute;
	sprite_[player.execute, dir.left] = s_player_execute;
	sprite_[player.execute, dir.down] = s_player_execute;
	break;
	
	case true:
	sprite_[player.execute, dir.right] = s_player_power_execute;
	sprite_[player.execute, dir.up] = s_player_power_execute;
	sprite_[player.execute, dir.left] = s_player_power_execute;
	sprite_[player.execute, dir.down] = s_player_power_execute;
	break;
}

if animation_hit_frame(3) {
	if !audio_is_playing(a_player_execution) {
		audio_play(a_player_execution);
	}
}