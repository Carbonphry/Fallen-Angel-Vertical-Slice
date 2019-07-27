/// @description Insert description here
// You can write your code in this editor
if place_meeting(x,y,o_player) and room5spawn == false {
	/*o_enemy_spawner.spawnR4 = 2;
	o_enemy_spawner.spawn = true;*/
	with instance_create_layer(224,120,"Solids", o_enemy_portal) {
		enemy_ = o_missile_angel;
	}
	
	with instance_create_layer(355,120,"Solids", o_enemy_portal) {
		enemy_ = o_missile_angel;
	}
	
	with instance_create_layer(286,97,"Solids", o_enemy_portal) {
		enemy_ = o_tankangel;
	}
	room5spawn = true;
}