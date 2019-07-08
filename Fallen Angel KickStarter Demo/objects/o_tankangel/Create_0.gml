
event_inherited();

initialize_movement_entity(0.5, .5, class_enemy_coll);
initialize_hurtbox_entity();

enum tankangel {
	hit,
	idle,
	wander,
	aggro,
	attack,
	wait,
	die,
	jump,
	jump_atk,
	get_up,
	lifted,
	stun,
	executed
}
max_health_ = 15;
health_ = max_health_;

starting_state_ = tankangel.idle;
state_ = starting_state_;

aggro_range_ = 60;

image_index = 0;
image_xscale = choose(1, -1);

alarm[1] = random_range(0,1) * global.one_second;

last_sprite = sprite_index;

die_sound = false;

uninterruptible = true;

jump = false;

targetX = noone;
targetY = noone;

onAir = false;
distanceTotal = noone;
posy = noone;
z = 0;
jumpdir = noone;
originX = x;
originY = y;
T_ = noone;

face = noone;

heavyknockdir = noone;

z_speed_gravity = .32;

thr = 13;

pulse_tim = global.one_second*1.2;

