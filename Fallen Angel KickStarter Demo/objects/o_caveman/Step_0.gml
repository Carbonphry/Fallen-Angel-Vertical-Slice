if health_ <= 0 /*&& state_ != enemy.hit*/ {
	
	if state_ != cherub.die {
		state_ = cherub.die;
		image_index = 0;
	} 
}

event_inherited();

if z != 0 and health_ > 0 {
	state_ = caveman.lifted;
	sprite_index = s_caveman_lifted;
	image_speed = 1;
}