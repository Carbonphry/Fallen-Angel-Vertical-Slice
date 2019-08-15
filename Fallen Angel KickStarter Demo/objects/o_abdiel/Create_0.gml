
event_inherited();

audio_stop_sound(a_music_dungeon);
audio_play_sound(a_music_abdiel,1,true);

initialize_movement_entity(0.25, .2, o_solid);
initialize_hurtbox_entity();

instance_activate_object(block_fight);

enum abdiel {
	hit,
	idle,
	intro,
	aggro,
	attack,
	wait,
	die,
	run,
	projectile,
	warp,
	wander,
	stun 
}
max_health_ = 20;
health_ = max_health_;

starting_state_ = abdiel.intro;
sprite_index = s_abdiel_intro;
state_ = starting_state_;

aggro_range_ = 60;

attackchance_ = 1;

image_index = 0;
image_xscale = choose(1, -1);

alarm[1] = random_range(0,1) * global.one_second;

last_sprite = sprite_index;

die_sound = false;

uninterruptible = false;

//Projectile round
round_ = 0;

bounce = false;

warp = false;

//Shader

DissolveAmount = 0;
col1 = c_yellow;//make_color_rgb(0.8*255,0,0);
col2 = c_orange//make_color_rgb(255,0.55*255,0);

//Call this once in your object before using the shader script
//col1 = make_color_rgb(0.8*255,0,0);
//col2 = make_color_rgb(255,0.55*255,0);
//DissolveSettings(sDissolve1,0,col1,col2,0.2);
DissolveSettings(sDissolve2,0,col1,col2,0.4);

stun_knockback_direction = noone;

death_line = true;