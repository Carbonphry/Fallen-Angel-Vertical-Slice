gml_pragma("forceinline");

x_ = (x+ random_range(-12,12));
y_ = (y+ random_range(-12,12));

if animation_hit_frame(4)
{
	var ef = create_animation_effect(s_red_sparks_effect,x_,y_,0.8,true);
	ef.depth = depth-1;
}

if animation_hit_frame(8)
{
	var ef = create_animation_effect(s_red_explosion_effect,x,y,0.8,true);
	ef.depth = depth-1;
	add_screenshake(12,20);
}

if animation_hit_frame(10)
{
	var ef = create_animation_effect(s_red_sparks_effect,x_,y_-10,0.8,true);
	ef.depth = depth-1;
}
