//Globals & Macros, Test skills
global.sigil = true;
global.dash_attack = false;
global.heavy_swing = false;
global.mark_upgrade = false;

enum player
{
	move = 0,
	sword = 1,
	sword2 = 2,
	sword3 = 3,
	evade = 4,
	idle = 5,
	heavy_attack = 6,
	heal = 7,
	falling = 8,
	hit = 9,
	hit_knockback = 10,
	land = 11,
	dead = 12,
	not_playable = 13,
	smash = 14,
	parry = 15,
	run_start = 16,
	run_stop = 17, 
	fall = 18,
	jump = 19,
	sigil = 20,
	bow = 21,
	found_item = 22,
	jump_attack = 23,
	transition = 24,
	glide = 25,
	intro = 26,
	ledge = 27,
	stanceSwitch = 28,
	trigger = 29,
	failHit = 30, 
	ram = 31,
	charge_attack = 32,
	execute  = 33,
	dash_parry = 34,
	
}

enum dir {
	right,
	up,
	left,
	down,
}

enum dir_dodge {
	right,
	right_up,
	up,
	left_up,
	left,
	left_down,
	down,
	right_down
}

if !instance_exists(o_pride_meter) {
	//instance_create_layer(-8, -6, "UI", o_pride_meter);
	instance_create_layer(4, 4, "UI", o_pride_meter);
}

if !instance_exists(o_hud) {
	instance_create_layer(0, 0, "UI", o_hud);
}


if !instance_exists(o_reticle) {
	instance_create_layer(0, 0, "Effects", o_reticle);
}
//****************************


init_player();

