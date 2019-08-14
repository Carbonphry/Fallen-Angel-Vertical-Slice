if room == r_intro_room1 {
	sprite_index = s_level_title_purgatory;
	}

	
if room == r_intro_room6 {
	sprite_index = s_level_title_astralcitadel;
	}
	
if room == r_intro_room7 {
	sprite_index = s_level_title_citadelroof;
	}
if room == r_gabriel_ancientcity_room1 {
	sprite_index = s_level_title_cradleofman;
	}


depth = -9999;
image_alpha = 0;
fade_ = false;
alpha_ = image_alpha;
var _view_width = camera_get_view_width(view_camera[0]);
var _view_height = camera_get_view_height(view_camera[0]);
//display_set_gui_size(480, 270);
//display_set_gui_size(960, 540);

gui_height_ = display_get_gui_height();
gui_width_ = display_get_gui_width();

//x = gui_width_ + 100;
//y = gui_height_ + 100;

title_ = sprite_index;

vx_ = camera_get_view_x(view_camera[0]);
vy_ = camera_get_view_y(view_camera[0]);


