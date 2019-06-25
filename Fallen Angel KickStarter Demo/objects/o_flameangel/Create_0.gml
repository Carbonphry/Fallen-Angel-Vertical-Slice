event_inherited()

initialize_movement_entity(0.5, .5, class_enemy_coll);
initialize_hurtbox_entity();

enum flameangel
{
	hit,
	idle,
	wander,
	aggro,
	attack,
	wait,
	die,
	run,
	explosion,
	get_up,
	lifted,
	stun
	
}
max_health_ = 8;
health_ = max_health_;

starting_state_ = flameangel.idle;
state_ = starting_state_;

aggro_range_ = 120;
attacked_ = false;

uninterruptible = false;
bleed_ = true;

image_index = 0;
image_xscale = choose(1, -1);

alarm[1] = random_range(0,1) * global.one_second;
alarm[2] = random_range(1,3) * global.one_second;

last_sprite = sprite_index;

die_sound = false;

thr = 9;

pulse_tim = global.one_second*1.8;