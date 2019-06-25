
event_inherited();

initialize_movement_entity(0.25, .5, class_enemy_coll);
initialize_hurtbox_entity();

enum cherub {
	hit,
	idle,
	wander,
	aggro,
	attack,
	wait,
	die,
	run,
	
}
max_health_ = 1;
health_ = max_health_;

starting_state_ = cherub.idle;
state_ = starting_state_;

aggro_range_ = 60;

image_index = 0;
image_xscale = choose(1, -1);

alarm[1] = random_range(0,1) * global.one_second;

last_sprite = sprite_index;

die_sound = false;

thr = 9;

pulse_tim = global.one_second*2;
alarm_set(9,pulse_tim);


stop = true;
_attack_angle = noone;
hit = false;