/// @description 2 Shards
// You can write your code in this editor
repeat 2 {
	var _item = o_shard;//choose(o_gem_pickup, o_heart_pickup);
	instance_create_layer(x, y-8, "Solids", _item);
}