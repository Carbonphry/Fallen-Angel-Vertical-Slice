/// @description Destroy
// You can write your code in this editor
with instance_create_depth(x+irandom_range(-10,10),y+irandom_range(-10,10),depth,o_fragment) {
	sprite_index = choose(s_core_chest_fragment_1,s_core_chest_fragment_2,s_core_chest_fragment_3,s_core_chest_fragment_4,s_core_chest_fragment_5,s_core_chest_fragment_6,s_core_chest_fragment_7, s_core_chest_fragment_8);
}

randomize();
with instance_create_depth(x+irandom_range(-10,10),y+irandom_range(-10,10),depth,o_fragment) {
	sprite_index = choose(s_core_chest_fragment_1,s_core_chest_fragment_2,s_core_chest_fragment_3,s_core_chest_fragment_4,s_core_chest_fragment_5,s_core_chest_fragment_6,s_core_chest_fragment_7, s_core_chest_fragment_8);
}
randomize();
with instance_create_depth(x+irandom_range(-10,10),y+irandom_range(-10,10),depth,o_fragment) {
	sprite_index = choose(s_core_chest_fragment_1,s_core_chest_fragment_2,s_core_chest_fragment_3,s_core_chest_fragment_4,s_core_chest_fragment_5,s_core_chest_fragment_6,s_core_chest_fragment_7, s_core_chest_fragment_8);
}
randomize();
with instance_create_depth(x+irandom_range(-10,10),y+irandom_range(-10,10),depth,o_fragment) {
	sprite_index = choose(s_core_chest_fragment_1,s_core_chest_fragment_2,s_core_chest_fragment_3,s_core_chest_fragment_4,s_core_chest_fragment_5,s_core_chest_fragment_6,s_core_chest_fragment_7, s_core_chest_fragment_8);
}
randomize();
var _times = choose(1,2,2,3);
repeat (_times) {
	var _item = o_heart_pickup;//choose(o_gem_pickup, o_heart_pickup);
	instance_create_layer(x, y-8, "Solids", _item);
}

with instance_create_depth(x+irandom_range(-3,3),y+irandom_range(-3,3),depth-10,o_smoke_puff) {
	image_speed = .8;
}
