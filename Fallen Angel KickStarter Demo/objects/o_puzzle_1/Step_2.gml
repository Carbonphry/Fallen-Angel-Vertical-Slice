/// @description Correct Sound
// You can write your code in this editor
if sprite_index == s_level_protodung_puzzle_1  {
	if play_sound {
		audio_play(a_puzzle_correct);
		play_sound = false;
	}
} else {
	play_sound = true;
}