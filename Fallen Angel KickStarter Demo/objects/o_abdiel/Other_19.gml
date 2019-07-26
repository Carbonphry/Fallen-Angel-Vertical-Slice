/// @description Warp

image_speed = 0.65;
switch (warp) {

	case false:
	sprite_index = s_abdiel_warpout;
	if animation_hit_frame(3) {
		instance_create_layer(x,y-20, "Instances", o_glow_burst_large);
	}
	if animation_hit_frame(4) {
		var _damage = 1;
		var _knockback = 5;
		var _life = 1;
		create_hitbox_knockback(s_abdiel_warp_hitbox, x, y, 0, _life, [class_player], _damage, _knockback);
		//instance_create_layer(x,y, "Instances", o_knockback_hitbox);
		add_screenshake(4,20);
		audio_play(a_abdiel_warpout);
		var _abdiel_attack = choose(a_abdiel_voice_attack1, a_abdiel_voice_attack2);
		if !audio_is_playing(_abdiel_attack) {
		audio_play(_abdiel_attack);
	}
	}
	break;
	
	case true:
	sprite_index = s_abdiel_warpin;
	if animation_hit_frame(1) {
		instance_create_layer(x,y-20, "Instances", o_glow_burst_large);
	}
	if animation_hit_frame(2) {
		var _damage = 1;
		var _knockback = 5;
		var _life = 1;
		create_hitbox_knockback(s_abdiel_warp_hitbox, x, y, 0, _life, [class_player], _damage, _knockback);
		//instance_create_layer(x,y, "Instances", o_knockback_hitbox);
		add_screenshake(4,20);
		audio_play(a_abdiel_warpin);
	}
	break;

}

if sprite_index == s_abdiel_warpout and animation_hit_frame(image_number-1) {

	randomize();
	//sprite_index = s_abdiel_warpin;
	/*var boss_room_x1 = 480;
	var boss_room_x2 = 690;
	var boss_room_y1 = 215;
	var boss_room_y2 = 300;*/
	var boss_room_x1 = 300;
	var boss_room_x2 = 670;
	var boss_room_y1 = 456;
	var boss_room_y2 = 616;
	x = irandom_range(boss_room_x1, boss_room_x2);
	y = irandom_range( boss_room_y1, boss_room_y2);
	warp = true;
}

if sprite_index == s_abdiel_warpin and animation_hit_frame(image_number-1) {
	alarm[3] = global.one_second*25;
	state_ = abdiel.projectile;
	warp = false;
}