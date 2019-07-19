/// @description Add to inv
// You can write your code in this editor
if global.ammo_count < 3 {
	 global.ammo_count++;
}
instance_destroy(id,true);