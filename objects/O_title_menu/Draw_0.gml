draw_set_font(F_tinyandchunky);
//get width and height of menu (dynamic)
var _new_width = 0;
for (var i = 0; i < op_length; i++)
{
	var _op_width = string_width(option[menu_level, i]);
	_new_width = max(_new_width, _op_width);
}

width = _new_width + op_border*3;
height = op_border*2 + string_height(option[0,0]) + (op_length-1)*op_space;

//center yo shit you dumbass menu
x = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0])/2) - width/2;
y = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0])/2) - height/2;

//draw menu bg
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

//draw options
draw_set_valign(fa_top);
draw_set_halign(fa_left);
for (var i = 0; i < op_length; i++)
{
	var _c = c_white;
	if position == i {_c = c_yellow};
	draw_text_colour(x+op_border, y+op_border+op_space*i, option[menu_level, i], _c, _c, _c, _c, 1);
}