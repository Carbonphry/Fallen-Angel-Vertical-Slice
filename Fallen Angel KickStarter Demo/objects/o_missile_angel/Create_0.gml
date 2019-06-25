event_inherited()

initialize_movement_entity(0.5, .5, class_enemy_coll);
initialize_hurtbox_entity();

enum missangel
{
	hit,
	idle,
	attack,
	die = 6,
	levitate
	
}
max_health_ = 5;
health_ = max_health_;

starting_state_ = missangel.idle;
state_ = starting_state_;

aggro_range_ = 120;
attacked_ = false;

uninterruptible = false;

image_index = 0;
image_xscale = choose(1, -1);

alarm[1] = random_range(0,1) * global.one_second;
alarm[2] = random_range(1,3) * global.one_second;

last_sprite = sprite_index;

die_sound = false;

z = 30;
thr = 13;

pulse_tim = global.one_second*1.5;

winganim = 0;
