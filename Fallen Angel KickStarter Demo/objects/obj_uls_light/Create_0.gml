/// @description Initialize Values

	//Set up Vertex
	vertex_format_begin();
	vertex_format_add_position();
	vertex_format_add_color();
	VertexFormat = vertex_format_end();

	VBuffer = vertex_create_buffer();
	
	//Set up Surface
	image_initial_alpha = image_alpha;
	light_radius = light_initial_radius;
	
	light_surf = -1;
	
	//Check if this one is a sprited light
	if (sprite_index != -1)
	{
		light_initial_radius = max( sprite_get_height(sprite_index) * image_yscale, sprite_get_width(sprite_index) * image_xscale);
		light_radius = light_initial_radius;
	}
	
	//Light Values
	Visible = true;
	
