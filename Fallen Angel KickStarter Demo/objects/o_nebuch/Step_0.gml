if health_ <= 0 /*&& state_ != enemy.hit*/ {
	
	if state_ != cherub.die {
		state_ = cherub.die;
		image_index = 0;
	} 
}

event_inherited();
