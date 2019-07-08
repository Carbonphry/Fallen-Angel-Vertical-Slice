
event_inherited();

initialize_movement_entity(0.25, .5, class_enemy_coll);
initialize_hurtbox_entity();

enum lancer {
	hit,
	idle,
	wander,
	aggro,
	attack,
	wait,
	die,
	run,
	attack2,
	get_up,
	lifted,
	stun,
	block,
	executed
}


max_health_ = 10;
health_ = max_health_;

starting_state_ = lancer.idle;
state_ = starting_state_;

aggro_range_ = 80;

bleed_ = true;

image_index = 0;
image_xscale = choose(1, -1);

alarm[1] = random_range(0,1) * global.one_second;

last_sprite = sprite_index;

die_sound = false;

uninterruptible = false;



///Shader
/// @desc Settings

DissolveAmount = 0;
col1 = make_color_rgb(0.8*255,0,0);
col2 = make_color_rgb(255,0.55*255,0);

//Call this once in your object before using the shader script
col1 = make_color_rgb(0.8*255,0,0);
col2 = make_color_rgb(255,0.55*255,0);
//DissolveSettings(sDissolve1,0,col1,col2,0.2);
DissolveSettings(sDissolve2,0,col1,col2,0.2);

thr = 9;

pulse_tim = global.one_second*1.5;


