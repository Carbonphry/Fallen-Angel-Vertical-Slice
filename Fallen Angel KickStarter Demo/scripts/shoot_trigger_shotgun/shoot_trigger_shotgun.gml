gml_pragma("forceinline");
var _life = 10;
var _damage = DMG_TRIGGER_PROJECTILE;
var _knockback = 1;
switch direction_facing_ {
		
		case dir.up:
		var _hitbox = create_hitbox_trigger_projectile(x+9, y-24,mouseDir, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x+9, y-24,mouseDir+20, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x+9, y-24,mouseDir-20, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		with instance_create_depth(x+9,y-24,other.depth-1,o_animation_effect) {
			sprite_index = s_player_burst_fire_effect;
			image_angle = other.mouseDir;
			image_speed = 2.5;
		}
		break;
		
		case dir.down:
		var _hitbox = create_hitbox_trigger_projectile(x-12, y,mouseDir, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x-12, y,mouseDir+20, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x-12, y,mouseDir-20, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		with instance_create_depth(x-2,y,other.depth-1,o_animation_effect) {
			sprite_index = s_player_burst_fire_effect;
			image_angle = other.mouseDir;
			image_speed = 2.5;
		}
		break;
		
		case dir.left:
		var _hitbox = create_hitbox_trigger_projectile(x-10, y-19,mouseDir, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x-10, y-19,mouseDir+20, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x-10, y-19,mouseDir-20, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		with instance_create_depth(x-10,y-19,other.depth-1,o_animation_effect) {
			sprite_index = s_player_burst_fire_effect;
			image_angle = other.mouseDir;
			image_speed = 2.5;
		}
		break;
		
		case dir.right:
		var _hitbox = create_hitbox_trigger_projectile(x+12, y-15,mouseDir, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x+12, y-15,mouseDir+20, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x+12, y-15,mouseDir-20, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		with instance_create_depth(x+14,y-15,other.depth-1,o_animation_effect) {
			sprite_index = s_player_burst_fire_effect;
			image_angle = other.mouseDir;
			image_speed = 2.5;
		}
		break;
}