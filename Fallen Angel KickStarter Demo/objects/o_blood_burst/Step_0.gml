if animation_hit_frame(3)
{
	instance_create_layer(x, y+8, "Solids", o_blood_burst_splatter);
}

image_alpha-=0.02;
if image_alpha<0 instance_destroy();