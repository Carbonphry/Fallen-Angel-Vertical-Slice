
if health_ <= 0 && state_ != enemy.hit 
{
	if state_ != missangel.die {
		state_ = missangel.die;
		image_index = 0;
	} 
}

var offset = sprite_height-sprite_yoffset;
depth = -y - offset;

if state_ != noone {
	 event_user(state_);
}

//Origin Ofsett compensation
depth += 9;

if instance_exists(class_player) {
	var target = instance_nearest(x,y,class_player);
	if target.x < x {
		image_xscale = -1;
	} else {
		image_xscale = 1;
	}
}

if (last_sprite != sprite_index) {
   image_index = 0;
   last_sprite = sprite_index;
}

if place_meeting(x,y-z,o_trigger_projectile) {
	event_perform(ev_collision,3);
}
//z_depth_system_enemy();