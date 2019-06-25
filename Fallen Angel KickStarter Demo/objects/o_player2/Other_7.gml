/*if state_ = player.hit {
	state_ = starting_state_;
}*/

if (sprite_index = s_player_damaged_down)
{
	state_ = starting_state_;
}

if (sprite_index = s_player_damaged_up)
{
	state_ = starting_state_;
}

if (sprite_index = s_player_damaged_right)
{
	state_ = starting_state_;
}

if (sprite_index = s_player_damaged_knockback)
{
	state_ = starting_state_;
}

if anim_run_start and ( sprite_index == s_player_run_up_start or sprite_index == s_player_run_right_start or sprite_index == s_player_run_down_start )  {
	anim_run_start = false;
}

if anim_run_stop /*and ( sprite_index == s_player_run_up_stop or sprite_index == s_player_run_right_stop or sprite_index == s_player_run_down_stop ) */ {
	anim_run_stop = false;
}

if sprite_index == s_player_heal then state_ = starting_state_;

if sprite_index == s_player_startspin {
	sprite_[player.smash, dir.right] = s_player_spinloop;
	sprite_[player.smash, dir.up] = s_player_spinloop;
	sprite_[player.smash, dir.left] = s_player_spinloop;
	sprite_[player.smash, dir.down] = s_player_spinloop;
} else if sprite_index == s_player_smash {
	state_ = player.idle;
	sprite_[player.smash, dir.right] = s_player_startspin;
	sprite_[player.smash, dir.up] = s_player_startspin;
	sprite_[player.smash, dir.left] = s_player_startspin;
	sprite_[player.smash, dir.down] = s_player_startspin;
}

if state_ == player.land then state_ = player.idle;