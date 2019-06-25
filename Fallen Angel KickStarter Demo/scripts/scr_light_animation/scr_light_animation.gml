///scr_light_animation
///@description Customizable values that change the light animation - in terms of size and alpha

	light_radius = light_initial_radius * (cos(current_time*0.01 + xstart)*0.05 + 0.95);
	image_alpha = image_initial_alpha * (sin(current_time*0.0006 + ystart)*0.15 + 0.85);