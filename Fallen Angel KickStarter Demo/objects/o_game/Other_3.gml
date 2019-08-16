/// @description Reset Game
// You can write your code in this editor
global.player_start_position = noone;
global.coop = noone;
global.destroyed = noone;
global.font = noone;
global.gamepad_active = noone;
global.inventory = noone;
global.i = noone;
global.one_second = noone;
global.player_gems = noone;
global.player_health = noone;
global.player_max_health = noone;
global.player_max_stamina = noone;
global.player_stamina = noone;
global.current_stage = noone;
global.sigil = 0;
global.dash_attack = false;
global.heavy_swing = false;
global.mark_upgrade = false;
global.puzzle_state_ = 1;
global.coop = false;
global.room4block = false;
global.room5block = false;
global.room_gabriel1_block = false;
global.intro_anim = false;
global.garden_elevator = false;
global.elevator_restart = false;
global.ammo_count = 0;
audio_stop_all();
draw_set_alpha(1);
draw_set_color(noone);
//instance_destroy(self,false);
display_set_gui_size(480,270);
instance_destroy(all,false);