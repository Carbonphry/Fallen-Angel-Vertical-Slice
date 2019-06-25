/// @description Run State
/*image_speed = .8;
sprite_index = s_abdiel_idle;
var target = instance_nearest(x,y,class_player);
switch (bounce) {
	
	case false:
	direction_ = point_direction(target.x, target.y, x, y); 
	break;
	
	case true:
	direction_ = point_direction(x, y, target.x, target.y); 
	break;
}

if alarm[1] <= 0
{
	//apply_friction_to_movement_entity();
	state_ = abdiel.idle;
	bounce = false;
} else {
	speed_ = 2;
	add_movement_maxspeed(direction_, 0.03, .6);
}


//move_movement_entity(true);
//alarm[1] = random_range(2, 3)*game_get_speed(gamespeed_fps);
