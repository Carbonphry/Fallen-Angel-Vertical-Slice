/// @description Not Playable
// You can write your code in this editor
if power_stance {
	sprite_[player.not_playable, dir.right] = s_player_power_idle;
	sprite_[player.not_playable, dir.up] = s_player_power_idle_up;
	sprite_[player.not_playable, dir.left] = s_player_power_idle;
	sprite_[player.not_playable, dir.down] = s_player_power_idle;
} else {
	sprite_[player.not_playable, dir.right] = s_player_idle;
	sprite_[player.not_playable, dir.up] = s_player_idle_up;
	sprite_[player.not_playable, dir.left] = s_player_idle;
	sprite_[player.not_playable, dir.down] = s_player_idle;	
}


image_speed = .3;
_speed_ = 0;
