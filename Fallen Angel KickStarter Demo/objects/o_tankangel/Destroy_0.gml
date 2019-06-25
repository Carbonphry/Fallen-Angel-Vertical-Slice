/// @description Insert description here
// You can write your code in this editor
event_inherited();
with instance_create_depth(x,y,950,o_corpse) {
	sprite_index = s_tankangel_die;
	image_index = image_number-1;
	image_speed = 0;
	image_xscale = other.image_xscale;
	darken_spr = s_tankangel_die_corpse_darken;
	//image_blend = c_gray;
}