/// @description Insert description here
// You can write your code in this editor
event_inherited();
if !can_pickup_ then exit;

var target = instance_nearest(x,y,class_player);
if distance_to_object(target) < 52 {
	move_towards_point(target.x,target.y,2.5);
	part_emitter_region(part_system_, part_emitter_, x-3, x+3, y-6,y-2,
	ps_shape_diamond, ps_distr_gaussian);
	image_angle+=3;
	part_emitter_burst(part_system_, part_emitter_, part_type_, 1);
} else {
	speed = 0;
}


//part_system_depth(part_system_, o_player.depth);
