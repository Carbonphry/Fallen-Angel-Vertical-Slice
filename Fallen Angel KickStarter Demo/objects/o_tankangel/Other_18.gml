/// @description Jump Attacked
sprite_index = s_tankangel_lifted;
image_speed = .8;
x+= 2;
/*
if !onAir {
	jumpdir = point_direction(x,y,targetX,targetY);
	var face;
	if jumpdir > 90 and jumpdir <= 270 {
		face = -1;
	} else { 
		face = 1;
	}
	image_xscale = sign(face);
}
*/
//image_xscale = sign(face);




/*
if animation_hit_frame(1) and animation_hit_frame(2) and animation_hit_frame(3){
	var target = instance_nearest(x,y,class_player);
	targetX = lengthdir_x(4,heavyknockdir); //target.x;
	targetY = lengthdir_y(4,heavyknockdir); //target.y;
	jumpdir = point_direction(x,y,targetX,targetY);
	
	if jumpdir > 90 and jumpdir <= 270 {
		face = -1;
	} else { 
		face = 1;
	}
	image_xscale = sign(face);
	
}

if animation_hit_frame(6) {
	onAir = true;
	distanceTotal = point_distance(x,y,targetX,targetY);
	T_ = current_time;
	var target = instance_nearest(x,y,class_player);
	targetX = target.x;
	targetY = target.y;
	originX = x;
	originY = y;

	speed_ = 0;
	jumpdir = point_direction(x,y,targetX,targetY);
	
	if jumpdir > 90 and jumpdir <= 270 {
		face = -1;
	} else { 
		face = 1;
	}
	image_xscale = sign(face);
	
	if instance_exists(o_tp_mark)
	{
		o_tp_mark.destroy_ = true;
	}
	if instance_exists(o_tp_projectile)
	{
		o_tp_projectile.can_tp_ = false;
	}
	
}

if onAir {        

	var peakHeight = 50;

	var t = (current_time-T_)/1000;
	//show_debug_message(string(t));
	t = min(t,1);
	x = lerp(originX, targetX,t);
	y = lerp(originY, targetY,t);
	
	var distanceRemaining = point_distance(x,y,targetX,targetY);
	//var percent = (distanceTotal-distanceRemaining) / distanceTotal;
	z = -peakHeight * sin(t * pi);
	y += z;
	//show_debug_message(string(t));
} 

if animation_hit_frame(9) {
	audio_play_sound(a_tankangel_attack, 5, false);
	onAir = false;
	var _damage = 2;
	var _knockback = 4;
	var _life = 1;
	z = 0;
	create_hitbox_knockback(s_tankangel_hitbox, x, y-8, 0, _life, [class_player], _damage, _knockback);
	//instance_create_layer(x,y, "Instances", o_knockback_hitbox);
	add_screenshake(4,15)
	//y = y-z
	speed_ = 0;
	
}



if animation_hit_frame(10) {
	state_ = tankangel.idle;
	speed_ = .5;
	alarm[3] = global.one_second*2.5;
	alarm[1] = global.one_second*.8;
	
} 
