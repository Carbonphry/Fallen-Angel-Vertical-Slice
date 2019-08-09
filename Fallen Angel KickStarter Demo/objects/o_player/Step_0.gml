///@description Resets
var air = instance_nearest(x,y,o_solid_air);
/*if place_meeting(x,y,o_solid_air) and place_meeting(air.x,air.y,id) {
	if ((state_ == player.idle or state_ == player.move or state_ == player.smash or state_ == player.ram) and z <= 0 ) {
		state_ = player.falling;
		alarm_set(8,global.one_second*.5);
	}
}*/

if o_input.alarm[6] {
	set_move_n(knockback_direction,knockback_ammount);
}

if global.player_health <= 0 and !invincible_ {
	state_ = player.dead;
	with (o_reticle) {
		instance_destroy(o_reticle,false);
	}
}
		
if (global.player_stamina < global.player_max_stamina) {
	global.player_stamina += 0.014;
}

if global.player_stamina <= 0.050 {
	alarm_set(9,global.one_second*1);
}

if o_input.action_four_released_ {
	can_dash = true;
}

/*if global.ammo_count < 3 {
	charge++;
	if charge == 60 {
		global.ammo_count++;
		charge = 0;
	}
}*/

if global.auto_jump_ = true and state_ != player.falling and state_ != player.ledge
{
	z_depth_system();
}



step_player(o_input);

