/// @description Insert description here
// You can write your code in this editor
with o_player {
	//alarm_set(10,1);
	if global.player_health <= 1 {
	state_ = player.dead;
} else {
	
	state_ = player.idle;
	x = spawn_point.x;
	y = spawn_point.y;
	instance_create_layer(x,y,"Effects",o_level_protodung_portal_arrive);
	z = 0;
	global.player_health--;
}
	visible = true;
}