/// @description Falling
// You can write your code in this editor
//if alarm_get(10) < 0 then alarm_set(10,global.one_second);
global.auto_jump_ = false;
image_speed = .8;
switch room {
	
	case r_intro_room2:
	case r_intro_room3:
	depth = 1350;
	break;
	
	case r_intro_room6:
	depth = 850;
	break;
	
	case r_intro_room7:
	depth = 750;
	break;
}

if !instance_exists(o_splash) {
	z -= 5;
} else {
	visible = false;
}


/*if y == 415 and health_ !=0 {
	health_ = 0;
	instance_create_depth(x,y,depth-1,o_splash);
}