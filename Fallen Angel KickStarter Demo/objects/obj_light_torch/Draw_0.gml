/// @description Alter

// Inherit the parent event
event_inherited();

// Draw brilho
gpu_set_blendmode(bm_add);

	var v_radius = 145 * random_range(0.995, 1.005);
	var v_alpha = 0.2;
	
	draw_set_alpha(v_alpha);
	draw_circle_color(x, y, v_radius, make_color_rgb(255, 238, 53), c_black, 0);
	
	var v_radius = 95;
	var v_alpha = 0.2 + random_range(0, 0.002);
	
	draw_set_alpha(v_alpha);
	draw_circle_color(x, y, v_radius, make_color_rgb(255, 237, 178), c_black, 0);
	
	draw_set_alpha(1);

	if (irandom(4) == 1)
	uls_set_light_alpha(self, 0.6 * random_range(0.93, 1.06))

gpu_set_blendmode(bm_normal);