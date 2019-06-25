/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (mouse_check_button(mb_left))
{
	var get_value = uls_get_light_alpha(self);
	get_value += (0.95 - get_value)*0.11;
	uls_set_light_alpha(self, get_value);
}
else
{
	var get_value = uls_get_light_alpha(self);
	get_value += (0 - get_value)*0.11;
	uls_set_light_alpha(self, get_value);
}