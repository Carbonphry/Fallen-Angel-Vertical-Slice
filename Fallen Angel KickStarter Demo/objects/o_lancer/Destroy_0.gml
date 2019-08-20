/// @description 3 Shards
// You can write your code in this editor
repeat 3 {
	var _item = o_shard;//choose(o_gem_pickup, o_heart_pickup);
	instance_create_layer(x, y-8, "Solids", _item);
}
if r_intro_room7 {
	var _depth = 890;
} else {
	var _depth = 890;
}
with instance_create_depth(x,y,_depth,o_corpse) {
	sprite_index = s_lancerangel_die;
	image_index = image_number-1;
	image_speed = 0;
	image_xscale = other.image_xscale;
	//image_blend = c_gray;
	darken_spr = s_lancerangel_die_corpse_darken;
}