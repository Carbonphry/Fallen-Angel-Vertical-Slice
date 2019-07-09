/*if state_ = player.hit {
	state_ = starting_state_;
}*/

if (sprite_index = s_player_damaged_down or sprite_index = s_player_power_damaged_down)
{
	state_ = starting_state_;
}

if (sprite_index = s_player_damaged_up or sprite_index = s_player_power_damaged_up)
{
	state_ = starting_state_;
}

if (sprite_index = s_player_damaged_right or  sprite_index = s_player_power_damaged_right)
{
	state_ = starting_state_;
}

if (sprite_index = s_player_damaged_knockback or sprite_index = s_player_power_knockback )
{
	state_ = starting_state_;
}

if anim_run_start and ( sprite_index == s_player_run_up_start or sprite_index == s_player_run_right_start or sprite_index == s_player_run_down_start or sprite_index == s_player_power_move_down_start or sprite_index == s_player_power_move_up_start or sprite_index == s_player_power_move_right_start)  {
	anim_run_start = false;
}

if anim_run_stop and ( sprite_index == s_player_run_up_stop or sprite_index == s_player_run_right_stop or sprite_index == s_player_run_down_stop or  sprite_index == s_player_power_move_down_stop or sprite_index == s_player_power_move_up_stop or  sprite_index == s_player_power_move_right_stop)  {
	anim_run_stop = false;
}

if (sprite_index == s_player_heal or sprite_index == s_player_power_heal) then state_ = starting_state_;

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
} else if sprite_index == s_player_power_smash_land {
	state_ = player.idle;
	sprite_[player.smash, dir.right] = s_player_power_smash_startspin;
	sprite_[player.smash, dir.up] = s_player_power_smash_startspin;
	sprite_[player.smash, dir.left] = s_player_power_smash_startspin;
	sprite_[player.smash, dir.down] = s_player_power_smash_startspin;
}

if sprite_index == s_player_power_smash_startspin {
	sprite_[player.smash, dir.right] = s_player_power_smash_spin;
	sprite_[player.smash, dir.up] = s_player_power_smash_spin;
	sprite_[player.smash, dir.left] = s_player_power_smash_spin;
	sprite_[player.smash, dir.down] = s_player_power_smash_spin;
} else if sprite_index == s_player_power_smash_spin {
	state_ = player.idle;
	sprite_[player.smash, dir.right] = s_player_power_smash_startspin;
	sprite_[player.smash, dir.up] = s_player_power_smash_startspin;
	sprite_[player.smash, dir.left] = s_player_power_smash_startspin;
	sprite_[player.smash, dir.down] = s_player_power_smash_startspin;
}

if state_ == player.land then state_ = player.idle;

if state_ == player.parry {
	state_ = starting_state_;
	rStick = noone;
}

if state_ == player.intro {
	global.intro_anim = true;
	state_ = player.idle;
}

if state_ == player.stanceSwitch {
	state_ = player.idle;
	iframe = false;
	if power_stance then o_pride_meter.ego_add = 40;
}


//Ledge Stuff

if sprite_index == s_player_ledge_up_on or sprite_index == s_player_ledge_down_on or sprite_index == s_player_ledge_right_on or sprite_index == s_player_ledge_left_on  then ledge_state = 2;

if ledge_state == 3 {
	switch direction_facing_ {
	
		case dir.up:
		y -= 35;
		break;
	
		case dir.down:
		y += 30;
		break;
		
		case dir.right:
		x += 25;
		y -= 25;
		break;
		
		case dir.left:
		x -= 25;
		y -= 25;
		break;
	
	}
	
	z = 9;
	state_ = starting_state_;
	ledge_state = 1;
	alarm_set(6, global.one_second*.5);
	o_input.up_ = true
}

if ledge_state == 4 {
	state_ = starting_state_;
	alarm_set(6,global.one_second*.5);
	ledge_state = 1;
	led_dir = noone;
}

if state_ == player.failHit {
	state_ = starting_state_;
}

if ramState == 0 and !o_input.action_two_ {
	ramState = 1;
} else if ramState == 0 and o_input.action_two_ {
	image_index = 6;
}

if ramState == 2  {
	sprite_[player.ram, dir.right] = s_player_power_ram_charge_right;
	sprite_[player.ram, dir.up] = s_player_power_ram_charge_up;
	sprite_[player.ram, dir.left] =  s_player_power_ram_charge_right;
	sprite_[player.ram, dir.down] = s_player_power_ram_charge_down;
	state_ = starting_state_;
	ramState = noone;
}

if sprite_index == s_player_chargeattack_attack {
	charge_state = 0;
	state_ = starting_state_;
	sprite_[player.charge_attack, dir.right] = s_player_chargeattack_start;
	sprite_[player.charge_attack, dir.up] = s_player_chargeattack_start_up;
	sprite_[player.charge_attack, dir.left] = s_player_chargeattack_start;
	sprite_[player.charge_attack, dir.down] = s_player_chargeattack_start;
}

if sprite_index == s_player_chargeattack_start {
	image_index = 0;
	charge_state = 1;
	sprite_[player.charge_attack, dir.right] = s_player_chargeattack_idle;
	sprite_[player.charge_attack, dir.up] = s_player_chargeattack_idle_up;
	sprite_[player.charge_attack, dir.left] = s_player_chargeattack_idle;
	sprite_[player.charge_attack, dir.down] = s_player_chargeattack_idle;
}

if sprite_index == s_player_power_chargeattack_attack {
	charge_state = 0;
	state_ = starting_state_;
	sprite_[player.charge_attack, dir.right] = s_player_power_chargeattack_start;
	sprite_[player.charge_attack, dir.up] = s_player_power_chargeattack_start_up;
	sprite_[player.charge_attack, dir.left] = s_player_power_chargeattack_start;
	sprite_[player.charge_attack, dir.down] = s_player_power_chargeattack_start;
}

if sprite_index == s_player_power_chargeattack_start {
	image_index = 0;
	charge_state = 1;
	sprite_[player.charge_attack, dir.right] = s_player_power_chargeattack_idle;
	sprite_[player.charge_attack, dir.up] = s_player_power_chargeattack_idle_up;
	sprite_[player.charge_attack, dir.left] = s_player_power_chargeattack_idle;
	sprite_[player.charge_attack, dir.down] = s_player_power_chargeattack_idle;
}

if sprite_index == s_player_chargeattack_attack_up {
	charge_state = 0;
	state_ = starting_state_;
	sprite_[player.charge_attack, dir.right] = s_player_chargeattack_start;
	sprite_[player.charge_attack, dir.up] = s_player_chargeattack_start_up;
	sprite_[player.charge_attack, dir.left] = s_player_chargeattack_start;
	sprite_[player.charge_attack, dir.down] = s_player_chargeattack_start;
}

if sprite_index == s_player_chargeattack_start_up {
	image_index = 0;
	charge_state = 1;
	sprite_[player.charge_attack, dir.right] = s_player_chargeattack_idle;
	sprite_[player.charge_attack, dir.up] = s_player_chargeattack_idle_up;
	sprite_[player.charge_attack, dir.left] = s_player_chargeattack_idle;
	sprite_[player.charge_attack, dir.down] = s_player_chargeattack_idle;
}

if sprite_index == s_player_power_chargeattack_attack_up {
	charge_state = 0;
	state_ = starting_state_;
	sprite_[player.charge_attack, dir.right] = s_player_power_chargeattack_start;
	sprite_[player.charge_attack, dir.up] = s_player_power_chargeattack_start_up;
	sprite_[player.charge_attack, dir.left] = s_player_power_chargeattack_start;
	sprite_[player.charge_attack, dir.down] = s_player_power_chargeattack_start;
}

if sprite_index == s_player_power_chargeattack_start_up {
	image_index = 0;
	charge_state = 1;
	sprite_[player.charge_attack, dir.right] = s_player_power_chargeattack_idle;
	sprite_[player.charge_attack, dir.up] = s_player_power_chargeattack_idle_up;
	sprite_[player.charge_attack, dir.left] = s_player_power_chargeattack_idle;
	sprite_[player.charge_attack, dir.down] = s_player_power_chargeattack_idle;
}

if state_ == player.execute {
	state_ = starting_state_;
	iframe = false;
}