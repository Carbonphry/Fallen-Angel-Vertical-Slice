

if fade_ = false{
	alpha_ += 0.01;
}

if alpha_ >= 1{
	alarm[0] = global.one_second*7;
	fade_ = true;
}

if fade_ = true{
	alpha_ -= 0.015;
}

if fade_ == true and alpha_ <= 0{
	instance_destroy();
}

