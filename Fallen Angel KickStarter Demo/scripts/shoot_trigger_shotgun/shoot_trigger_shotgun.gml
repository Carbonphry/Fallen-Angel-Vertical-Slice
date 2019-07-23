gml_pragma("forceinline");
var _life = 20;
var _damage = DMG_TRIGGER_PROJECTILE;
var _knockback = 1;
switch direction_facing_ {
		
		case dir.up:
		var _hitbox = create_hitbox_trigger_projectile(x+lengthdir_x(9,mouseDir), y-24,mouseDir+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x+lengthdir_x(9,mouseDir), y-24,mouseDir+20+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x+lengthdir_x(9,mouseDir), y-24,mouseDir-20+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x+lengthdir_x(9,mouseDir), y-24,mouseDir+10+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x+lengthdir_x(9,mouseDir), y-24,mouseDir-10+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		with instance_create_depth(x+9,y-24,other.depth-1,o_animation_effect) {
			sprite_index = s_player_burst_fire_effect;
			image_angle = other.mouseDir;
			image_speed = 2.5;
		}
		break;
		
		case dir.down:
		var _hitbox = create_hitbox_trigger_projectile(x-lengthdir_x(12,mouseDir), y,mouseDir+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x-lengthdir_x(12,mouseDir), y,mouseDir+20+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x-lengthdir_x(12,mouseDir), y,mouseDir-20+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x-lengthdir_x(12,mouseDir), y,mouseDir+10+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x-lengthdir_x(12,mouseDir), y,mouseDir-10+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		with instance_create_depth(x-2,y,other.depth-1,o_animation_effect) {
			sprite_index = s_player_burst_fire_effect;
			image_angle = other.mouseDir;
			image_speed = 2.5;
		}
		break;
		
		case dir.left:
		var _hitbox = create_hitbox_trigger_projectile(x-10, y-lengthdir_y(19,mouseDir),mouseDir+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x-10, y-lengthdir_y(19,mouseDir),mouseDir+20+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x-10, y-lengthdir_y(19,mouseDir),mouseDir-20+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x-10, y-lengthdir_y(19,mouseDir),mouseDir+10+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x-10, y-lengthdir_y(19,mouseDir),mouseDir-10+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		with instance_create_depth(x-10,y-19,other.depth-1,o_animation_effect) {
			sprite_index = s_player_burst_fire_effect;
			image_angle = other.mouseDir;
			image_speed = 2.5;
		}
		break;
		
		case dir.right:
		var _hitbox = create_hitbox_trigger_projectile(x+12, y-16+lengthdir_y(1,mouseDir)/*+irandom_range(-5,5)*/,mouseDir+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
	/*	var _hitbox = create_hitbox_trigger_projectile(x+12, y-lengthdir_y(1,mouseDir)+20+irandom_range(-5,5),mouseDir+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x+12, y-lengthdir_y(1,mouseDir)-20+irandom_range(-5,5),mouseDir+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x+12, y-lengthdir_y(1,mouseDir)-10+irandom_range(-5,5),mouseDir+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x+12, y-lengthdir_y(1,mouseDir)+10+irandom_range(-5,5),mouseDir+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		/*var _hitbox = create_hitbox_trigger_projectile(x+12, y-15,mouseDir+20+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x+12, y-15,mouseDir-20+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x+12, y-15,mouseDir+10+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		var _hitbox = create_hitbox_trigger_projectile(x+12, y-15,mouseDir-10+irandom_range(-5,5), _life, [o_enemy, o_grass, o_bush], _damage, _knockback);*/
		with instance_create_depth(x+14,y-15,other.depth-1,o_animation_effect) {
			sprite_index = s_player_burst_fire_effect;
			image_angle = other.mouseDir;
			image_speed = 2.5;
		}
		break;
}