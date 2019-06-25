/// @description cast a shadow of this line segment from the point light
/// scr_castshadow( x1, y1, x2, y2, LightX, LightY, z)
/// @param VB Vertex buffer
/// @param R Radius Radius
/// @param Ax  x1
/// @param Ay  y1
/// @param Bx  x2
/// @param By  y2
/// @param Lx  Light x
/// @param Ly  Light Y
/// @param Z Z

	//Set Up
	var _vb = argument0;
	var _r	= argument1;

	var _Ax = argument2;
	var _Ay = argument3;

	var _Bx = argument4;
	var _By = argument5;

	var _Lx = argument6;
	var _Ly = argument7;
	
	var _Z	= argument8;

	// shadows are infinite - almost, just enough to go off screen
	var cast_length = 20000;
	var Adx,Ady,Bdx,Bdy,len

	// get unit length to point 1
	Adx = _Ax-_Lx;      
	Ady = _Ay-_Ly;      
	len = (1.0*cast_length)/sqrt( (Adx*Adx)+(Ady*Ady) );      // unit length scaler * Shadow length
	Adx = _Ax + Adx * len;
	Ady = _Ay + Ady * len;

	// get unit length to point 2
	Bdx = _Bx-_Lx;      
	Bdy = _By-_Ly;      
	len = (1.0*cast_length) / sqrt( (Bdx*Bdx)+(Bdy*Bdy) );    // unit length scaler * Shadow length
	Bdx = _Bx + Bdx * len;
	Bdy = _By + Bdy * len;

	// now build a quad
	var offsetx = (_Lx)*-1 + _r;
	var offsety = (_Ly)*-1 + _r;
	
	//var colour_argb = floor(_Z * 255) * power(256, 3);
	
	vertex_position(_vb, _Ax + offsetx,_Ay + offsety);
	vertex_color(_vb, c_black, _Z);

	vertex_position(_vb, _Bx + offsetx,_By + offsety);
	vertex_color(_vb, c_black, _Z);

	vertex_position(_vb, Adx + offsetx,Ady + offsety);
	vertex_color(_vb, c_black, _Z);

	vertex_position(_vb, _Bx + offsetx,_By + offsety);
	vertex_color(_vb, c_black, _Z);

	vertex_position(_vb, Adx + offsetx,Ady + offsety);
	vertex_color(_vb, c_black, _Z);

	vertex_position(_vb, Bdx + offsetx,Bdy + offsety);
	vertex_color(_vb, c_black, _Z);
	
	/*
	vertex_position(_vb, _Ax + offsetx,_Ay + offsety);
	vertex_argb(_vb, colour_argb);

	vertex_position(_vb, _Bx + offsetx,_By + offsety);
	vertex_argb(_vb, colour_argb);

	vertex_position(_vb, Adx + offsetx,Ady + offsety);
	vertex_argb(_vb, colour_argb);

	vertex_position(_vb, _Bx + offsetx,_By + offsety);
	vertex_argb(_vb, colour_argb);

	vertex_position(_vb, Adx + offsetx,Ady + offsety);
	vertex_argb(_vb, colour_argb);

	vertex_position(_vb, Bdx + offsetx,Bdy + offsety);
	vertex_argb(_vb, colour_argb);