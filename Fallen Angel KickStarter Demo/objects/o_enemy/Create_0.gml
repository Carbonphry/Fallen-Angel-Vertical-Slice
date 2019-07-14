initialize_movement_entity(1, .5, class_enemy_coll);
initialize_hurtbox_entity();

image_speed = 0;

max_health_ = noone;
health_ = noone;

starting_state_ = noone;
state_ = starting_state_;
last_sprite = sprite_index;

enum enemy {
	hit 
}

current_layer_= LAYER1;

jump = false;
z = 0;
z_ground        = 0; 
z_speed         = 0; 
z_speed_gravity = .25;

levitate = false;
pulseanim = 0;
alarm_set(9,global.one_second*2);

thr = 0;

pulse_tim = noone;

last_x = x;
last_y = y;

knockback_direction = noone;
knockback_ammount = noone;

stp = 0;
parriable = false;