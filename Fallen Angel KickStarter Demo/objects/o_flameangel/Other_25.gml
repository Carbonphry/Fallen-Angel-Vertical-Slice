/// @description Go down
// You can write your code in this editor
depth = 950;
image_speed = .8;
sprite_index = s_flameangel_lifted;

z-=2;

if z < -20 {
	instance_destroy(id,true);
}

//if z <=  -100 then state_ = flameangel.die;