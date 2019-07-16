if health_ <= 0 && state_ != enemy.hit {
	if state_ != lancer.die {
		state_ = lancer.die;
		image_index = 0;
	} 
}

event_inherited();

//Origin Ofsett compensation
depth += 5;

if z != 0 and health_ > 0 {
	state_ = lancer.lifted;
	sprite_index = s_lancerangel_lifted;
	image_speed = 1;
}

