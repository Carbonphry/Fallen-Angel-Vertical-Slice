/// @description Insert description here
// You can write your code in this editor
draw_sprite(s_medium_shadow, 0, x, y+6);
//draw_self();
draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
if state_ != lancer.block {
	draw_self_flash(c_red, 6, alarm[0]);
}

/*
if alarm_get(9) < global.one_second*.42 {
	if class_player.power_stance == true then draw_sprite(s_pulse_effect,pulseanim,x,y-z-thr);
	if pulseanim > 3 {
		pulseanim = 0;
		alarm_set(9,global.one_second*1.5);
	}
	pulseanim +=0.1;
}*/

if alarm_get(8) > 0 {
	var life_size = max(health_/max_health_,0);
	//draw_text_color(x_bar_b+5/*x_bar_b+30*/,y_bar_b-14,"Holy Seraph Abdiel",c_white,c_yellow,c_white,c_yellow,1);
	draw_sprite(s_enemy_bar,0,x,y-sprite_height/2-z);
	draw_sprite_ext(s_enemy_bar_life, 0, x-10,y-sprite_height/2-z, life_size, 1, 0, c_white, 1);
}
///Run shader
/*
//Wave back and forth between 1 and 0 for the demo
DissolveAmount = 1 + ((0 - 1) * 0.5) + sin((((current_time * 0.001) + 8 * 0) / 8) * (pi*2)) * ((0 - 1) * 0.5); 

//Draw the sprite using the shader, that's it!
DissolveShader(sprite_index,image_index,x,y,DissolveAmount);

