/// @description Insert description here
// You can write your code in this editor
if place_meeting(x,y,o_player) and lancerspawn == false {
	/*o_enemy_spawner.spawnR4 = 2;
	o_enemy_spawner.spawn = true;*/
	with instance_create_layer(320,137,"Solids", o_enemy_portal) {
		enemy_ = o_lancer;
	}
	with instance_create_layer(260,137,"Solids", o_enemy_portal) {
		enemy_ = o_lancer;
	}
	lancerspawn = true;
}