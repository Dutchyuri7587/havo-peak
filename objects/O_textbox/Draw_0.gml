get_controls();

box_x = camera_get_view_x(view_camera[0]) + camera_offset_x;
box_y = camera_get_view_y(view_camera[0]) + camera_offset_y;

#region setup
if !setup
{
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	for (var p = 0; p < nof_pages; p++) // p stands for page
	{
		length_text[p] = string_length(text[p]);
		
		//centered
		text_x_offset[p] = 42; // this one is a general x offset for both dialogue and textbox
	}
}
#endregion
#region typing
if draw_character < length_text[page]
{
	draw_character += speed_text;
	draw_character = clamp(draw_character,0,length_text[page]);
}
#endregion
#region go through pages
if acceptkey
{
	if draw_character == length_text[page]
	{
		if page < nof_pages-1
		{
			page++;
			draw_character = 0;
		}
		else
		{
			instance_destroy();
		}
	}
	else
	{
		draw_character = length_text[page];
	}
}
#endregion




#region making the textbox
var _textbox_x = box_x + text_x_offset[page];
var _textbox_y = box_y;

textbox_image += textbox_image_speed;
textbox_sprite_width = sprite_get_width(textbox_sprite);
textbox_sprite_height = sprite_get_height(textbox_sprite);

//back of textbox
draw_sprite_ext
(
textbox_sprite, 
textbox_image, 
_textbox_x, 
_textbox_y, 
textbox_width/textbox_sprite_width, 
textbox_height/textbox_sprite_height,
0,
c_white,
1
)
#endregion
#region options
if draw_character == length_text[page] && page == nof_pages - 1
{
	var _option_space = 15; //vertical space between options
	var _option_border = 4; // same as textbox border
	for (var op = 0; op < option_number[0]; op++)
	{
		var _option_width = string_width(option[op]) + _option_border*2;
		
		draw_sprite_ext(textbox_sprite, textbox_image, _textbox_x + 16,  _textbox_y - _option_space*option_number + _option_space*op, _option_width/textbox_sprite_width, (_option_space-1)/textbox_sprite_height, 0, c_white, 1 )
		
		draw_text(_textbox_x+16+_option_border, _textbox_y - _option_space*option_number + _option_space*op+2, option[op]);
	}
}
#endregion



//draw text
var _drawtext = string_copy(text[page], 1, draw_character);

draw_text_ext(_textbox_x + border_offset, _textbox_y + border_offset, _drawtext, line_seperation, line_width)

