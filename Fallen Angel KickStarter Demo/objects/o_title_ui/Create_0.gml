enum options
{
	new_game,
	continue_game,
	quit
}

menu_color_ = make_color_rgb(247, 243, 143); //185, 248, 216
menu_dark_color_ = make_color_rgb(126, 127, 81); //58, 173, 133

//option_[options.continue_game_game] = "Continue";
option_[options.new_game] = "Start Game";
option_[options.continue_game] = "Continue";
option_[options.quit] = "Quit";

option_length_ = array_length_1d(option_)

index_ = options.new_game;

gui_height_ = display_get_gui_height();
gui_width_ = display_get_gui_width();

x_ = 240;//gui_width_ -800;
y_ = 180;//gui_height_-390;

alpha = 0;

anim_select = 0;