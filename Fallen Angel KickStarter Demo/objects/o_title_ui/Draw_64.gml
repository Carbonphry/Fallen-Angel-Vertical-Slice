var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);

switch o_menu_intro.sprite_index {
	case s_title_start:
	layer_background_alpha(back_id,alpha)
	draw_set_alpha(alpha);
	break;
	
	case s_title_loop:
	layer_background_alpha(back_id,alpha)
	alpha += .035;
	draw_set_alpha(alpha);
	break;
	
}


anim_select +=.1;
if anim_select >= 3 then anim_select = 0;

if index_ == options.new_game {
	draw_sprite(s_button_new_game_selected,anim_select,240,180);
} else {
	draw_sprite(s_button_new_game,0,240,180);
}

if index_ == options.continue_game {
	draw_sprite(s_button_coop_selected_1,anim_select,240,210);
} else {
	draw_sprite(s_button_coop_1,0,240,210);
}

if index_ == options.quit {
	draw_sprite(s_button_exit_selected,anim_select,240,240);
} else {
	draw_sprite(s_button_exit,0,240,240);
}
/*
draw_set_halign(fa_center)
for (var _i = 0; _i<option_length_; _i++)
{
	if _i == index_
	{
		draw_set_color(menu_color_);
	} else
	{
		draw_set_color(menu_dark_color_);
	}
	draw_text_transformed(x_, y_+_i*25, option_[_i], 1.5, 1.5, 0);
}
draw_set_color(c_white);
draw_set_halign(fa_left);

*/

draw_set_alpha(1);