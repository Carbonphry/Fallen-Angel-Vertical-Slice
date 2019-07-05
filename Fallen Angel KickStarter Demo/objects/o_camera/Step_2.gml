switch global.coop {
	
	case false:
	if !instance_exists(o_abdiel) {
		target_ = o_player;
	}
	break;
	
	case true:
	if !instance_exists(o_coop_cam) {
		instance_create_depth(0,0,0,o_coop_cam);
	}
	target_ = o_coop_cam;
	break;

}
if not instance_exists(target_) exit;

with target_ {
	if place_meeting(x,y,o_x_lock) /*and point_distance(x,y,o_x_lock.x,o_x_lock.y) < 50*/ { 
		o_camera.x_lock = true;
	} else { 
		o_camera.x_lock = false;
	}
	
	if place_meeting(x,y,o_y_lock) /*and point_distance(x,y,o_x_lock.x,o_x_lock.y) < 50*/ { 
		o_camera.y_lock = true;
	} else { 
		o_camera.y_lock = false;
	}
	
	if place_meeting(x,y,o_xy_lock) /*and point_distance(x,y,o_x_lock.x,o_x_lock.y) < 50*/ { 
		o_camera.xy_lock = true;
	} else { 
		o_camera.xy_lock = false;
	}
} 



x += random_range(-screenshake_, screenshake_);
y += random_range(-screenshake_, screenshake_);

if x_lock {
	var x_lock_ = instance_nearest(o_player.x,o_player.y,o_x_lock);
	var _target_x = x_lock_.x;
	var _target_y = target_.y - target_.z/5;

} else if y_lock {

	var y_lock_ = instance_nearest(o_player.x,o_player.y,o_y_lock);
	var _target_x = target_.x;
	var _target_y = y_lock_.y - target_.z/5;

} else if xy_lock {

	var xy_lock_ = instance_nearest(o_player.x,o_player.y,o_xy_lock);
	var _target_x = xy_lock_.x;
	var _target_y = xy_lock_.y - target_.z/5;

} else {
	
	//Camera goes to player`s direction
	switch (o_player.direction_facing_) {

	case dir.right:
	var _target_x = target_.x+15;
	var _target_y = target_.y - target_.z/5;
	break;
	
	case dir.left:
	var _target_x = target_.x-15;
	var _target_y = target_.y - target_.z/5;
	break;
	
	case dir.up:
	var _target_x = target_.x;
	var _target_y = target_.y-15 - target_.z/5;
	break;
	
	case dir.down:
	var _target_x = target_.x;
	var _target_y = target_.y+15 - target_.z/5;
	break;

	}

}

x = lerp(x, _target_x, 0.1);
y = lerp(y , _target_y-8- target_.z, 0.1);
x = round_n(x, 1/scale_);
y = round_n(y, 1/scale_);


var wh = max(0,x-width_/2);
var ht = max(y-height_/2,0);

camera_set_view_pos(view_camera[0], min(wh,room_width-480), min(ht, room_height-270));


