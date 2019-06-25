
if instance_exists(o_player) 
{
	x = o_player.x
	y = o_player.y
	image_alpha += 0.1;
} else
{
	image_alpha -= 0.1;
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


if o_player.gliding == true {

	sprite_index = sprite_[o_player.direction_facing_];
	
}

if o_player.state_ == player.ledge {
	 
	 instance_destroy(id,false);  
}

if o_player.state_ == player.move and o_player.gliding {
	visible = false;
} else {
		visible = true;
}