/// @description Insert description here
// You can write your code in this editor
draw_set_font(fn_10);
anim_select +=.1;
if anim_select >= 2 then anim_select = 0;

if index_ == 0 {
	draw_sprite(s_button_main_menu_selected,anim_select,170,170);
} else {
	draw_sprite(s_button_main_menu,0,170,170);
}

if index_ == 1 {
	draw_sprite(s_button_exit_selected,anim_select,305,170);
} else {
	draw_sprite(s_button_exit,0,305,170);
}