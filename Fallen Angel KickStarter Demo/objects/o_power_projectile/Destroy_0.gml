/// @description Hit fx
// You can write your code in this editor
//instance_create_depth(x,y-z,depth,o_swing_fx_critical);
/*if impact_ = true
{

	if sprite_index = s_player_burst_projectile
	{
	instance_create_depth(x,y-z,depth,o_swing_fx)
	}

	if sprite_index = s_player_burst_projectile_critical
	{
	instance_create_depth(x,y-z,depth,o_swing_fx_critical)
	}
}*/

instance_create_depth(x,y,depth,o_fx_power_charge_explosion);
add_screenshake(4, global.one_second*.3);