
var _view_width = camera_get_view_width(view_camera[0]);
var _view_height = camera_get_view_height(view_camera[0]);
//display_set_gui_size(480, 270);
//display_set_gui_size(960, 540);

paused_ = false; 
paused_sprite_ = noone;
freeze_sprite_ = noone;
paused_sprite_scale = .25;//display_get_gui_width()/view_wport[0];

gui_height_ = display_get_gui_height();
gui_width_ = display_get_gui_width();

x_bar_ = gui_width_- 426;
y_bar_ = gui_height_- 242;

x_bar_b = gui_width_ -350;
y_bar_b = gui_height_ -30;
instance_create_layer(x_bar_,y_bar_, "UI", o_hud_life);

global.item[0] = noone;
global.item[1] = noone;
item_index_ = 0;
text_dialog = false;
inventory_create(6);
inventory_add_item(o_sigil_item);

skip = false;
page = 1;

//Pause Menu Variables
enum pauseoptions
{
	resume,
	main_menu,
	//new_game,
	//credits,
	quit
}

menu_color_ = make_color_rgb(247, 243, 143); //185, 248, 216
menu_dark_color_ = make_color_rgb(126, 127, 81); //58, 173, 133

option_[pauseoptions.resume] = "Continue";
option_[pauseoptions.main_menu] = "Main Menu";
//option_[options.new_game] = "New Game";
//option_[options.continue_game] = "Credits";
option_[pauseoptions.quit] = "Quit";

option_length_ = array_length_1d(option_)

index_ = pauseoptions.resume;

gui_height_ = display_get_gui_height();
gui_width_ = display_get_gui_width();

x_ = 240;//gui_width_ -800;
y_ = 150;//gui_height_-390;

anim_select = 0;

core_count = 0;
core_anim = 0;
dmg_anim = 0;
low_stam_anim = 0;
show_stamina = false;


weapon_sprite = s_weapon_blade_active;

ui_alpha_ammo = 0;
ui_alpha_cores = 0;
