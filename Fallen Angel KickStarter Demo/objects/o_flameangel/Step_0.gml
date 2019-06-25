
if health_ <= 0 && state_ != enemy.hit 
{
	if state_ != flameangel.die {
		state_ = flameangel.die;
		image_index = 0;
	} 
	
}

event_inherited();
//Origin Ofsett compensation
depth += 9;

if z != 0 and health_ > 0 {
	state_ = flameangel.lifted;
	sprite_index = s_flameangel_lifted;
	image_speed = 1;
}

//z_depth_system_enemy();