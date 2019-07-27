gml_pragma("forceinline");
device = noone;
device = global.input[1];//This variable has to be updated on the instance create of another obj

initialize_movement_entity(0.2, 0.5, o_solid);
initialize_hurtbox_entity();

//from 700 to 300 depth. Layer1/Layer5

//if o_solid.depth = LAYER1;

//instance_create_layer(0, 0, "Solids", o_input);


image_speed = 0;
acceleration_ = 0.5;
max__speed_ = 1;
roll__speed_ = 2;
direction_facing_ = dir.right;
dodge_direction_ = dir.right;
roll_direction_ = 0;
combo_ = false;
attacking_ = false;
evading_ = false;
throwing_ = false;
marked_ = false;
footsteps_playing_ = false;
footsteps_can_play_ = true
evade_stamina_cost_ = 1.5;
///items
sword_equipped_ = false;
sigil_equipped_ = false;


starting_state_ = player.idle;
state_= starting_state_;

// Sprite move lookup table
sprite_[player.idle, dir.right] = s_player_idle;
sprite_[player.idle, dir.up] = s_player_idle_up;
sprite_[player.idle, dir.left] = s_player_idle;
sprite_[player.idle, dir.down] = s_player_idle;

sprite_[player.move, dir.right] = s_player_run_right;
sprite_[player.move, dir.up] = s_player_run_up;
sprite_[player.move, dir.left] = s_player_run_right;
sprite_[player.move, dir.down] = s_player_run_down;

sprite_[player.transition, dir.right] = s_player_run_right;
sprite_[player.transition, dir.up] = s_player_run_up;
sprite_[player.transition, dir.left] = s_player_run_right;
sprite_[player.transition, dir.down] = s_player_run_down;

sprite_[player.glide, dir.right] = s_player_glide_right__;
sprite_[player.glide, dir.up] = s_player_glide_up;
sprite_[player.glide, dir.left] = s_player_glide_right__;
sprite_[player.glide, dir.down] = s_player_glide_down__;

sprite_[player.sword, dir.right] = s_player_attack_right_1;
sprite_[player.sword, dir.up] = s_player_attack_up_1;
sprite_[player.sword, dir.left] = s_player_attack_right_1;
sprite_[player.sword, dir.down] = s_player_attack_down_1;

sprite_[player.sword2, dir.right] = s_player_attack_right_2;
sprite_[player.sword2, dir.up] = s_player_attack_up_2;
sprite_[player.sword2, dir.left] = s_player_attack_right_2;
sprite_[player.sword2, dir.down] = s_player_attack_down_2;

sprite_[player.sword3, dir.right] = s_player_attack_right_3;
sprite_[player.sword3, dir.up] = s_player_attack_up_3;
sprite_[player.sword3, dir.left] = s_player_attack_right_3;
sprite_[player.sword3, dir.down] = s_player_attack_down_3;

sprite_[player.evade, dir.right] = s_player_dash_right;
sprite_[player.evade, dir.up] = s_player_dash_up;
sprite_[player.evade, dir.left] = s_player_dash_right;
sprite_[player.evade, dir.down] = s_player_dash_down;

sprite_[player.hit, dir.right] = s_player_damaged_right;
sprite_[player.hit, dir.up] = s_player_damaged_up;
sprite_[player.hit, dir.left] = s_player_damaged_right;
sprite_[player.hit, dir.down] = s_player_damaged_down;

sprite_[player.hit_knockback, dir.right] = s_player_damaged_knockback;
sprite_[player.hit_knockback, dir.up] = s_player_damaged_knockback;
sprite_[player.hit_knockback, dir.left] = s_player_damaged_knockback;
sprite_[player.hit_knockback, dir.down] = s_player_damaged_knockback;

sprite_[player.parry, dir.right] = s_player_parry_right;
sprite_[player.parry, dir.up] = s_player_parry_up;
sprite_[player.parry, dir.left] = s_player_parry_right;
sprite_[player.parry, dir.down] = s_player_parry_down;

sprite_[player.dead, dir.right] = s_player_dead;
sprite_[player.dead, dir.up] = s_player_dead;
sprite_[player.dead, dir.left] = s_player_dead;
sprite_[player.dead, dir.down] = s_player_dead;

sprite_[player.not_playable, dir.right] = s_player_idle;
sprite_[player.not_playable, dir.up] = s_player_idle_up;
sprite_[player.not_playable, dir.left] = s_player_idle;
sprite_[player.not_playable, dir.down] = s_player_idle;

sprite_[player.smash, dir.right] = s_player_startspin;
sprite_[player.smash, dir.up] = s_player_startspin;
sprite_[player.smash, dir.left] = s_player_startspin;
sprite_[player.smash, dir.down] = s_player_startspin;

sprite_[player.jump, dir.right] = s_player_jump_right;
sprite_[player.jump, dir.up] = s_player_jump_up;
sprite_[player.jump, dir.left] = s_player_jump_right;
sprite_[player.jump, dir.down] = s_player_jump_down;

sprite_[player.fall, dir.right] = s_player_fall_right;
sprite_[player.fall, dir.up] = s_player_fall_up;
sprite_[player.fall, dir.left] = s_player_fall_right;
sprite_[player.fall, dir.down] = s_player_fall_down;

sprite_[player.falling, dir.right] = s_player_fall_right;
sprite_[player.falling, dir.up] = s_player_fall_up;
sprite_[player.falling, dir.left] = s_player_fall_right;
sprite_[player.falling, dir.down] = s_player_fall_down;

sprite_[player.run_start, dir.right] = s_player_run_right_start;
sprite_[player.run_start, dir.up] =  s_player_run_up_start;
sprite_[player.run_start, dir.left] = s_player_run_right_start;
sprite_[player.run_start, dir.down] = s_player_run_down_start;

sprite_[player.run_stop, dir.right] = s_player_run_right_stop;
sprite_[player.run_stop, dir.up] =  s_player_run_up_stop;
sprite_[player.run_stop, dir.left] = s_player_run_right_stop;
sprite_[player.run_stop, dir.down] = s_player_run_down_stop;

/*sprite_[player.enemy_coll, dir.right] = s_player_damaged_right;
sprite_[player.enemy_coll, dir.up] = s_player_damaged_up;
sprite_[player.enemy_coll, dir.left] = s_player_damaged_right;
sprite_[player.enemy_coll, dir.down] = s_player_damaged_down;*/

sprite_[player.heavy_attack, dir.right] = s_player_power_uppercut_right;
sprite_[player.heavy_attack, dir.up] = s_player_power_uppercut_up;
sprite_[player.heavy_attack, dir.left] = s_player_power_uppercut_right;
sprite_[player.heavy_attack, dir.down] = s_player_power_uppercut_down;

sprite_[player.heal, dir.right] = s_player_heal;
sprite_[player.heal, dir.up] = s_player_heal;
sprite_[player.heal, dir.left] =  s_player_heal;
sprite_[player.heal, dir.down] = s_player_heal;

sprite_[player.land, dir.right] = s_player_jump_land_right;
sprite_[player.land, dir.up] = s_player_jump_land_up;
sprite_[player.land, dir.left] =  s_player_jump_land_right;
sprite_[player.land, dir.down] = s_player_jump_land_down;

sprite_[player.intro, dir.right] = s_player_bloodspawn;
sprite_[player.intro, dir.up] = s_player_bloodspawn;
sprite_[player.intro, dir.left] =  s_player_bloodspawn;
sprite_[player.intro, dir.down] = s_player_bloodspawn;

sprite_[player.ledge, dir.right] = s_player_ledge_right;
sprite_[player.ledge, dir.up] = s_player_ledge_up;
sprite_[player.ledge, dir.left] =  s_player_ledge_left;
sprite_[player.ledge, dir.down] = s_player_ledge_down;

sprite_[player.trigger, dir.right] = s_player_power_burst_right;
sprite_[player.trigger, dir.up] = s_player_power_burst_up;
sprite_[player.trigger, dir.left] = s_player_power_burst_left;
sprite_[player.trigger, dir.down] = s_player_power_burst_down;

sprite_[player.failHit, dir.right] = s_player_failedhit_right;
sprite_[player.failHit, dir.up] = s_player_failedhit_up;
sprite_[player.failHit, dir.left] =  s_player_failedhit_right;//s_player_failedhit_left;
sprite_[player.failHit, dir.down] = s_player_failedhit_down;

sprite_[player.ram, dir.right] = s_player_power_ram_charge_right;
sprite_[player.ram, dir.up] = s_player_power_ram_charge_up;
sprite_[player.ram, dir.left] =  s_player_power_ram_charge_right;
sprite_[player.ram, dir.down] = s_player_power_ram_charge_down;

sprite_[player.charge_attack, dir.right] = s_player_chargeattack_start;
sprite_[player.charge_attack, dir.up] = s_player_chargeattack_start_up;
sprite_[player.charge_attack, dir.left] = s_player_chargeattack_start;
sprite_[player.charge_attack, dir.down] = s_player_chargeattack_start;

sprite_[player.execute, dir.right] = s_player_execute;
sprite_[player.execute, dir.up] = s_player_execute;
sprite_[player.execute, dir.left] = s_player_execute;
sprite_[player.execute, dir.down] = s_player_execute;

sprite_[player.dash_parry, dir.right] = s_player_dash_parry_right;
sprite_[player.dash_parry, dir.up] = s_player_dash_parry_up;
sprite_[player.dash_parry, dir.left] = s_player_dash_parry_right;
sprite_[player.dash_parry, dir.down] = s_player_dash_parry_down;

last_sprite = sprite_index;

anim_run_start = true;
anim_run_stop = false;

anim_cancel = false;

pass = false;

vsp = 0;

///Z variables
z               = 0; 
z_ground        = 0; 
z_speed         = 0; 
z__speed_gravity = .25;
last_z  = z;

can_move = true;
 
left     = o_input.left_;
right    = o_input.right_;
up       = o_input.up_;
down     = o_input.down_;

step = 0;

power_stance = false;

///Power Stance Particles
part_system_stance=part_system_create();

part_emitter_=part_emitter_create(part_system_stance);

part_type_=part_type_create();
part_type_sprite(part_type_, s_smoke, true, false, true);
part_type_alpha3(part_type_, 0.5, 1, 0.1);

part_type_life(part_type_, global.one_second*.1, global.one_second*.2);
part_type_scale(part_type_, 1, 1);


jump_slash = false;
animSlash = 0;
gliding = false;
//Shader
DissolveAmount = 0;
col1 = c_black;//make_color_rgb(0.8*255,0,0);
col2 = c_gray;//make_color_rgb(255,0.55*255,0);

//Call this once in your object before using the shader script
//col1 = make_color_rgb(0.8*255,0,0);
//col2 = make_color_rgb(255,0.55*255,0);
//DissolveSettings(sDissolve1,0,col1,col2,0.2);
DissolveSettings(sDissolve21,0,col1,col2,0.8);

spawn_point = noone;

dmgX = 0; 

player_spd = 3;

shascale = 1;

//Ledge System
fake_z = 1;
ledge_state = 1;
led_dir = noone;
direction_facing_before_jump = noone;

iframe = false;

triggerCount = 0;

mouseDir = noone;

ramState = noone;

can_glide = false;

rStick = noone;

right_stick = false;

charge_state = 0;

reticle_anim = 0;

burst_arm_anim = 0;

parry = true;

old_image_index = noone;

angX = noone;

evade_step = true;

charge = 0;

global.ammo_count = 3;

knockback_direction = noone;
knockback_ammount = noone;