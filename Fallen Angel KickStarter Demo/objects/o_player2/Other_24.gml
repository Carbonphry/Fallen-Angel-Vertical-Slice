/// @description Smash
// You can write your code in this editor

if z == z_ground {
	image_speed = .75;
	sprite_[player.smash, dir.right] = s_player_smash;
	sprite_[player.smash, dir.up] = s_player_smash;
	sprite_[player.smash, dir.left] = s_player_smash;
	sprite_[player.smash, dir.down] = s_player_smash;
	
	if animation_hit_frame(0.5) {
		add_screenshake(3,global.one_second*.2);
		audio_play(a_player_attack_smash_land);
		if !global.coop {
			set_vibration(.5, .5 ,.2);
		}
	}
	
	if animation_hit_frame(1.5) {
		if dmgX <= 15 {
				var _damage = 1;
			} else if dmgX <= 30 {
				var _damage = 2;
			} else {
				var _damage = 3;	
			}
			var _life = 2;
			var _knockback = 8;
			var _hitbox = create_hitbox(s_smash_hitbox, x, y, 0, _life, [o_enemy, o_grass, o_bush, o_shrine], _damage, _knockback);	
			dmgX = 0;
		}
} else {
	z_depth_system();
	var _life = 1;
	var _damage = 1;
	var _knockback = 0;
	var _hitbox = create_hitbox(s_smash_hitbox, x, y, 0, _life, [o_enemy, o_grass, o_bush, o_shrine], _damage, _knockback);
	_hitbox.toground = true; 
	image_speed = 1.2;
}

