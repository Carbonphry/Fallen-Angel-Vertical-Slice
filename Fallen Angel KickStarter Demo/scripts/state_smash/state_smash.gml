/// @description Smash
// You can write your code in this editor
global.auto_jump_ = false;

if z == z_ground {
	if !place_meeting(x,y,o_solid_air) {
		image_speed = .75;
		switch power_stance {
		
		case false:
		sprite_[player.smash, dir.right] = s_player_smash;
		sprite_[player.smash, dir.up] = s_player_smash;
		sprite_[player.smash, dir.left] = s_player_smash;
		sprite_[player.smash, dir.down] = s_player_smash;
		break;
		
		case true:
		sprite_[player.smash, dir.right] = s_player_power_smash_land;
		sprite_[player.smash, dir.up] = s_player_power_smash_land;
		sprite_[player.smash, dir.left] = s_player_power_smash_land;
		sprite_[player.smash, dir.down] = s_player_power_smash_land;
		break;
		
		}
		if animation_hit_frame(0.5) {
			audio_play(a_player_attack_smash_land);
			add_screenshake(10,10);
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
			var _life = 1;
			var _knockback = 8;
			var _hitbox = create_hitbox(s_smash_hitbox, x, y, 0, _life, [o_enemy, o_grass, o_bush, o_shrine], _damage, _knockback);	
			_hitbox.lift = false;
			dmgX = 0;
			with _hitbox {
				if place_meeting(x,y,o_enemy) {
					o_pride_meter.ego_pts += PTS_ATTACK_SMASH;	
				}
			
			}
			
		}
	} else {
		state_ = player.falling;
	}
} else {
	z_depth_system();
	var _life = 1;
	var _damage = 1;
	var _knockback = 0;
	var _hitbox = create_hitbox(s_smash_hitbox, x, y-10, 0, _life, [o_enemy, o_grass, o_bush, o_shrine], _damage, _knockback);
	_hitbox.toground = true; 
	_hitbox.lift = false;
	dmgX++; 
	image_speed = 1.2;
	instance_create_layer(o_player.x, o_player.y-o_player.z, "Effects", o_particle_smash);
}