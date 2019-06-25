/// @description Insert description here
// You can write your code in this editor
if o_level_garden_warper1.platform_activate {
	image_speed = 50;
} else {
	if image_index > 0 {
		image_speed =-.8;
	} else {
		image_speed = 0;
		//instance_deactivate_object(number);
		
	}
}