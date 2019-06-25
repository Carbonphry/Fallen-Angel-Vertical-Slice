/// @description Volume and Hp
// You can write your code in this editor
if show_volume {
	draw_text(435,5,string(vol*100));
}
/*
if global.player_health >= 5 {
	draw_set_alpha(0);
	draw_rectangle_color(0, 0, gui_width_, gui_height_, c_red, c_black,  c_black, c_black, false);
	draw_set_alpha(1);
} else if global.player_health >= 4 and global.player_health <= 4.999 {
	draw_set_alpha(0.015);
	draw_rectangle_color(0, 0, gui_width_, gui_height_, c_red, c_black,  c_black, c_black, false);
	draw_set_alpha(1);
} else if global.player_health >= 3 and global.player_health <= 3.999 {
	draw_set_alpha(0.03);
	draw_rectangle_color(0, 0, gui_width_, gui_height_, c_red, c_black,  c_black, c_black, false);
	draw_set_alpha(1);
} else if global.player_health >= 2 and global.player_health <= 2.999 {
	draw_set_alpha(0.045);
	draw_rectangle_color(0, 0, gui_width_, gui_height_, c_red, c_black,  c_black, c_black, false);
	draw_set_alpha(1);
} else if global.player_health >= 1 and global.player_health <= 1.999 {
	draw_set_alpha(0.06);
	draw_rectangle_color(0, 0, gui_width_, gui_height_, c_red, c_black,  c_black, c_black, false);
	draw_set_alpha(1);
}  else if global.player_health >= -2 and global.player_health <= 0.999 {
	draw_set_alpha(0.08);
	draw_rectangle_color(0, 0, gui_width_, gui_height_, c_red, c_black,  c_black, c_black, false);
	draw_set_alpha(1);
}
	
//draw_set_alpha(  global.player_health/20  );
/*draw_rectangle_color(0, 0, gui_width_, gui_height_, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

