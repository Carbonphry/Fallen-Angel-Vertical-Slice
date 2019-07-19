/// @description Globals n Macros
fullscreen = true;
gui_height_ = display_get_gui_height();
gui_width_ = display_get_gui_width();

global.one_second = room_speed;  //game_get_speed(game_speed_fps);
global.destroyed = [];
var _font_string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ.abcdefghijklmnopqrstuvwxyz1234567890>,!':-+";
global.font = font_add_sprite_ext(s_font, _font_string, true, 1);
draw_set_font(global.font);
global.current_stage = room;
global.player_max_health = 6;
global.player_health = global.player_max_health;
global.player_max_stamina = 8;
global.player_stamina = global.player_max_stamina;
global.player_gems = 0;
global.player_start_position = i_game_start; //o_start_position;
global.sigil = false;
global.dash_attack = false;
global.heavy_swing = false;
global.mark_upgrade = false;
global.puzzle_state_ = 0;
global.coop = false;
global.vibration = true;
global.auto_jump_ = false;
global.room4block = true;
global.room5block = true;
global.intro_anim = false;
global.freeze = false;

vol = 1;
show_volume = false;

//MACROS
#macro LAYER0 800
#macro LAYER1 700
#macro LAYER2 600
#macro LAYER3 500
#macro LAYER4 400
#macro LAYER5 300
//Balance
#macro CHEST_LUCIFER s_player_idle
#macro CHEST_ABDIEL s_abdiel_intro
#macro COST_DASH 1
#macro COST_TRIGGER 0
#macro COST_PARRY 1
#macro COST_SMASH 1
#macro COST_RAM 1
#macro DMG_SWING 1
#macro DMG_SMASH 1
#macro DMG_PARRY 1
#macro DMG_TRIGGER_PROJECTILE .5
#macro DMG_RAM 4
#macro DMG_HEAVY 2
#macro DMG_THIRD_SWING 2
#macro AIR_SWING_KNOCKFORWARD 0

#macro PTS_ATTACK_1 1
#macro PTS_ATTACK_2 1
#macro PTS_ATTACK_3 2
#macro PTS_ATTACK_SMASH 3
#macro PTS_PARRY 2 
#macro PTS_HIT 2 

