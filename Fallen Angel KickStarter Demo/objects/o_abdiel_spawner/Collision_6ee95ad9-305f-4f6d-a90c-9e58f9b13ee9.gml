/// @description 
if !instance_exists(o_enemy) and !instance_exists(o_enemy_portal) {
	instance_create_layer(x,y+90,"Enemies",o_spawn_abdiel);
	instance_destroy(id,true);
}
