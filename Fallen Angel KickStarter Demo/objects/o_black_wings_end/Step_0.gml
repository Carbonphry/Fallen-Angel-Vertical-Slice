
if instance_exists(o_player) 
{
	x = o_player.x
	y = o_player.y
	image_alpha -= 0.07;
} 

if image_alpha <= 0
{
	instance_destroy();
}

if o_player.direction_facing_ == dir.up {
	depth = o_player.depth-1;  
} else {
	depth = o_player.depth+1; 
}