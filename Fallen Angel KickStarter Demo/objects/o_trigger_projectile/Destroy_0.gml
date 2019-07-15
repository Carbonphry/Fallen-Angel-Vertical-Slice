/// @description Hit fx
// You can write your code in this editor
if sprite_index = s_player_burst_projectile
{
instance_create_depth(x,y-z,depth,o_swing_fx)
}

if sprite_index = s_player_burst_projectile_critical
{
instance_create_depth(x,y-z,depth,o_swing_fx_critical)
}