gml_pragma("forceinline");
var _life =100;
var _damage = DMG_TRIGGER_PROJECTILE*8;
var _knockback = 1;
switch direction_facing_ {
		
		case dir.up:
		var _hitbox = create_hitbox_trigger_precise_power(x+9, y-24,mouseDir, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		with instance_create_depth(x+9,y-24,other.depth-1,o_animation_effect) {
			sprite_index = s_player_burst_fire_effect;
			image_angle = other.mouseDir;
			image_speed = 2.5;
		}
		var _smoke_muff = instance_create_depth(x,y-18,depth-100,o_smoke_puff);
		_smoke_muff.image_speed = .85;
		_smoke_muff.speed = .5;
		_smoke_muff.direction = mouseDir;
					
		var _smoke_particle = instance_create_depth(x+irandom_range(-5,5),y-18,depth-100,o_smoke_particle);
		_smoke_particle.direction = mouseDir +irandom_range(-5,5);
		var _smoke_particle = instance_create_depth(x+irandom_range(-5,5),y-18,depth-100,o_smoke_particle);
		_smoke_particle.direction = mouseDir +irandom_range(-5,5);
		var _smoke_particle = instance_create_depth(x+irandom_range(-5,5),y-18,depth-100,o_smoke_particle);
		_smoke_particle.direction = mouseDir +irandom_range(-5,5);
		var _smoke_particle = instance_create_depth(x+irandom_range(-5,5),y-18,depth-100,o_smoke_particle);
		_smoke_particle.direction = mouseDir +irandom_range(-5,5);
		break;
		
		case dir.down:
		var _hitbox = create_hitbox_trigger_precise_power(x-12, y,mouseDir, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		with instance_create_depth(x-2,y,other.depth-1,o_animation_effect) {
			sprite_index = s_player_burst_fire_effect;
			image_angle = other.mouseDir;
			image_speed = 2.5;
		}
		var _smoke_muff = instance_create_depth(x,y+18,depth-100,o_smoke_puff);
		_smoke_muff.image_speed = .85;
		_smoke_muff.speed = .5;
		_smoke_muff.direction = mouseDir;
					
		var _smoke_particle = instance_create_depth(x+irandom_range(-5,5),y+18,depth-100,o_smoke_particle);
		_smoke_particle.direction = mouseDir +irandom_range(-5,5);
		var _smoke_particle = instance_create_depth(x+irandom_range(-5,5),y+18,depth-100,o_smoke_particle);
		_smoke_particle.direction = mouseDir +irandom_range(-5,5);
		var _smoke_particle = instance_create_depth(x+irandom_range(-5,5),y+18,depth-100,o_smoke_particle);
		_smoke_particle.direction = mouseDir +irandom_range(-5,5);
		var _smoke_particle = instance_create_depth(x+irandom_range(-5,5),y+18,depth-100,o_smoke_particle);
		_smoke_particle.direction = mouseDir +irandom_range(-5,5);
		break;
		
		case dir.left:
		var _hitbox = create_hitbox_trigger_precise_power(x-10, y-19,mouseDir, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		with instance_create_depth(x-10,y-19,other.depth-1,o_animation_effect) {
			sprite_index = s_player_burst_fire_effect;
			image_angle = other.mouseDir;
			image_speed = 2.5;
		}
		var _smoke_muff = instance_create_depth(x-15,y-18,depth-100,o_smoke_puff);
		_smoke_muff.image_speed = .85;
		_smoke_muff.speed = .5;
		_smoke_muff.direction = mouseDir;
					
		var _smoke_particle = instance_create_depth(x-15,y-18+irandom_range(-5,5),depth-100,o_smoke_particle);
		_smoke_particle.direction = mouseDir +irandom_range(-5,5);
		var _smoke_particle = instance_create_depth(x-15,y-18+irandom_range(-5,5),depth-100,o_smoke_particle);
		_smoke_particle.direction = mouseDir +irandom_range(-5,5);
		var _smoke_particle = instance_create_depth(x-15,y-18+irandom_range(-5,5),depth-100,o_smoke_particle);
		_smoke_particle.direction = mouseDir +irandom_range(-5,5);
		var _smoke_particle = instance_create_depth(x-15,y-18+irandom_range(-5,5),depth-100,o_smoke_particle);
		_smoke_particle.direction = mouseDir +irandom_range(-5,5);
		break;
		
		case dir.right:
		var _hitbox = create_hitbox_trigger_precise_power(x+12, y-15,mouseDir, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		with instance_create_depth(x+14,y-15,other.depth-1,o_animation_effect) {
			sprite_index = s_player_burst_fire_effect;
			image_angle = other.mouseDir;
			image_speed = 2.5;
		}
		var _smoke_muff = instance_create_depth(x+15,y-18,depth-100,o_smoke_puff);
		_smoke_muff.image_speed = .85;
		_smoke_muff.speed = .5;
		_smoke_muff.direction = mouseDir;
					
		var _smoke_particle = instance_create_depth(x+15,y-18+irandom_range(-5,5),depth-100,o_smoke_particle);
		_smoke_particle.direction = mouseDir +irandom_range(-5,5);
		var _smoke_particle = instance_create_depth(x+15,y-18+irandom_range(-5,5),depth-100,o_smoke_particle);
		_smoke_particle.direction = mouseDir +irandom_range(-5,5);
		var _smoke_particle = instance_create_depth(x+15,y-18+irandom_range(-5,5),depth-100,o_smoke_particle);
		_smoke_particle.direction = mouseDir +irandom_range(-5,5);
		var _smoke_particle = instance_create_depth(x+15,y-18+irandom_range(-5,5),depth-100,o_smoke_particle);
		_smoke_particle.direction = mouseDir +irandom_range(-5,5);
		break;
}