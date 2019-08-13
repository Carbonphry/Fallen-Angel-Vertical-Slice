gml_pragma("forceinline");
var _life =100;
var _damage = DMG_TRIGGER_PROJECTILE*8;
var _knockback = 1;
var radious = 5;

switch direction_facing_ {
		
	case dir.right:
	var projectileX = x+5+(lengthdir_x(radious,mouseDir));
	var projectileY = y-19+(lengthdir_y(radious,mouseDir));
	with instance_create_depth(x+5,y-19,other.depth-1,o_animation_effect) {
		sprite_index = s_player_burst_fire_effect;
		image_angle = other.mouseDir;
		image_speed = 2.5;
	}
	var _smoke_muff = instance_create_depth(x+5,y-19,depth-100,o_smoke_puff);
	_smoke_muff.image_speed = .85;
	_smoke_muff.speed = .5;
	_smoke_muff.direction = mouseDir;
					
	var _smoke_particle = instance_create_depth(x+5+irandom_range(-5,5),y-19,depth-100,o_smoke_particle);
	_smoke_particle.direction = mouseDir +irandom_range(-5,5);
	var _smoke_particle = instance_create_depth(x+5+irandom_range(-5,5),y-19,depth-100,o_smoke_particle);
	_smoke_particle.direction = mouseDir +irandom_range(-5,5);
	var _smoke_particle = instance_create_depth(x+5+irandom_range(-5,5),y-19,depth-100,o_smoke_particle);
	_smoke_particle.direction = mouseDir +irandom_range(-5,5);
	var _smoke_particle = instance_create_depth(x+5+irandom_range(-5,5),y-19,depth-100,o_smoke_particle);
	_smoke_particle.direction = mouseDir +irandom_range(-5,5);
	break;
	
	case dir.left:
	var projectileX = x-3+(lengthdir_x(radious,mouseDir));
	var projectileY = y-19+(lengthdir_y(radious,mouseDir));
	with instance_create_depth(x-3,y-19,other.depth-1,o_animation_effect) {
		sprite_index = s_player_burst_fire_effect;
		image_angle = other.mouseDir;
		image_speed = 2.5;
	}
	var _smoke_muff = instance_create_depth(x-1,y-17,depth-100,o_smoke_puff);
	_smoke_muff.image_speed = .85;
	_smoke_muff.speed = .5;
	_smoke_muff.direction = mouseDir;
					
	var _smoke_particle = instance_create_depth(x-3+irandom_range(-5,5),y-19,depth-100,o_smoke_particle);
	_smoke_particle.direction = mouseDir +irandom_range(-5,5);
	var _smoke_particle = instance_create_depth(x-3+irandom_range(-5,5),y-19,depth-100,o_smoke_particle);
	_smoke_particle.direction = mouseDir +irandom_range(-5,5);
	var _smoke_particle = instance_create_depth(x-3+irandom_range(-5,5),y-19,depth-100,o_smoke_particle);
	_smoke_particle.direction = mouseDir +irandom_range(-5,5);
	var _smoke_particle = instance_create_depth(x-3+irandom_range(-5,5),y-19,depth-100,o_smoke_particle);
	_smoke_particle.direction = mouseDir +irandom_range(-5,5);
	break;
	
	case dir.up:

	var projectileX = x-1+(lengthdir_x(radious,mouseDir));
	var projectileY = y-17+(lengthdir_y(radious,mouseDir));
	with instance_create_depth(x-1,y-17,other.depth-1,o_animation_effect) {
		sprite_index = s_player_burst_fire_effect;
		image_angle = other.mouseDir;
		image_speed = 2.5;
	}
	
	var _smoke_muff = instance_create_depth(x-1,y-17,depth-100,o_smoke_puff);
	_smoke_muff.image_speed = .85;
	_smoke_muff.speed = .5;
	_smoke_muff.direction = mouseDir;
					
	var _smoke_particle = instance_create_depth(x-1+irandom_range(-5,5),y-17,depth-100,o_smoke_particle);
	_smoke_particle.direction = mouseDir +irandom_range(-5,5);
	var _smoke_particle = instance_create_depth(x-1+irandom_range(-5,5),y-17,depth-100,o_smoke_particle);
	_smoke_particle.direction = mouseDir +irandom_range(-5,5);
	var _smoke_particle = instance_create_depth(x-1+irandom_range(-5,5),y-17,depth-100,o_smoke_particle);
	_smoke_particle.direction = mouseDir +irandom_range(-5,5);
	var _smoke_particle = instance_create_depth(x-1+irandom_range(-5,5),y-17,depth-100,o_smoke_particle);
	_smoke_particle.direction = mouseDir +irandom_range(-5,5);
	break;
	
	case dir.down:
	var projectileX = x-2+(lengthdir_x(radious,mouseDir));
	var projectileY = y-21+(lengthdir_y(radious,mouseDir));
	with instance_create_depth(x-2,y-21,other.depth-1,o_animation_effect) {
		sprite_index = s_player_burst_fire_effect;
		image_angle = other.mouseDir;
		image_speed = 2.5;
	}
	
	var _smoke_muff = instance_create_depth(x-2,y-21,depth-100,o_smoke_puff);
	_smoke_muff.image_speed = .85;
	_smoke_muff.speed = .5;
	_smoke_muff.direction = mouseDir;
					
	var _smoke_particle = instance_create_depth(x-2+irandom_range(-5,5),y-21,depth-100,o_smoke_particle);
	_smoke_particle.direction = mouseDir +irandom_range(-5,5);
	var _smoke_particle = instance_create_depth(x-2+irandom_range(-5,5),y-21,depth-100,o_smoke_particle);
	_smoke_particle.direction = mouseDir +irandom_range(-5,5);
	var _smoke_particle = instance_create_depth(x-2+irandom_range(-5,5),y-21,depth-100,o_smoke_particle);
	_smoke_particle.direction = mouseDir +irandom_range(-5,5);
	var _smoke_particle = instance_create_depth(x-2+irandom_range(-5,5),y-21,depth-100,o_smoke_particle);
	_smoke_particle.direction = mouseDir +irandom_range(-5,5);
	break;
}
create_hitbox_trigger_precise_power(projectileX, projectileY, mouseDir, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);

/*
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