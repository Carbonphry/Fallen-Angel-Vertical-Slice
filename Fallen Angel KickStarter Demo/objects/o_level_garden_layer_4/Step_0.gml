/// @description Insert description here
// You can write your code in this editor
if o_player.current_layer_ == LAYER1 or o_player.current_layer_ == LAYER2 {
	depth = o_player.depth-1; 
} else if o_player.current_layer_ == LAYER4 or o_player.current_layer_ == LAYER5 {
	depth = o_player.depth+1; 
}