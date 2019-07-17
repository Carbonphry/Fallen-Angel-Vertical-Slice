/// @description Wings
// You can write your code in this editor
draw_sprite(s_large_shadow1, 0, x, y);
//draw_self();
draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
draw_self_flash(c_red, 6, alarm[0]);
/*
if alarm_get(9) < global.one_second*.42 {
	if class_player.power_stance == true then draw_sprite(s_pulse_effect,pulseanim,x,y-z-thr);
	if pulseanim > 3 {
		pulseanim = 0;
		alarm_set(9,global.one_second*1.5);
	}
	pulseanim +=0.1;
}*/

if alarm_get(8) > 0 and health_ > 0 {
	//var life_size = max(health_/max_health_,0);
	//draw_text_color(x_bar_b+5/*x_bar_b+30*/,y_bar_b-14,"Holy Seraph Abdiel",c_white,c_yellow,c_white,c_yellow,1);
	draw_sprite_ext(s_hp_bar_8, 0, x-13,y-sprite_height/2-z, 1, 1, 0, c_white, 1);
	if health_ > 0 {
		draw_sprite(s_8_hp,health_,x-13,y-sprite_height/2-z);
	} else {
		draw_sprite(s_8_hp,0,x-13,y-sprite_height/2-z);
	}
}