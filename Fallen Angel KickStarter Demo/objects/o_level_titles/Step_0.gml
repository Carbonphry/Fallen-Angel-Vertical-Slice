if fade_ = false{
	alpha_ += 0.01;
}

if alpha_ >= 1{
	alarm[0] = global.one_second*5;
	fade_ = true;
}

if fade_ = true{
	alpha_ -= 0.01;
}

if fade_ = true and alpha_ <= 0{
	instance_destroy();
}

if room == r_intro_room1 {
	sprite_index = s_level_title_purgatory;
	}

	
if room == r_intro_room6 {
	sprite_index = s_level_title_astralcitadel;
	}
