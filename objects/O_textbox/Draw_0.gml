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
	
	nof_pages = array_length(text);
	
	for (var p = 0; p < nof_pages; p++) // p stands for page
	{
		length_text[p] = string_length(text[p]);
		
		//centered
		text_x_offset[p] = 44;
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
textbox_image += textbox_image_speed;
textbox_sprite_width = sprite_get_width(textbox_sprite);
textbox_sprite_height = sprite_get_height(textbox_sprite);

//back of textbox
draw_sprite_ext
(
textbox_sprite, 
textbox_image, 
box_x+text_x_offset[page], 
box_y, 
textbox_width/textbox_sprite_width, 
textbox_height/textbox_sprite_height,
0,
c_white,
1
)

//draw text
var _drawtext = string_copy(text[page], 1, draw_character);

draw_text_ext(box_x+text_x_offset[page] + border_offset, box_y + border_offset, _drawtext, line_seperation, line_width)

#endregion