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
		
		for (var c = 0; c < length_text[p]; c++)
		{
			var _character_position = c+1;
			
			character[c, p] = string_char_at(text[p], _character_position);
			
			//get width of line
			var _text_up_to_character = string_copy(text[p], 1, _character_position);
			var _current_text_width = string_width(_text_up_to_character) - string_width(character[c, p]);
			
			//get last free space
			if character[c, p] = " " {last_free_space = _character_position+1};
			
			//get line breaks
			if _current_text_width - line_break_offset[p] > line_width
			{
				line_break_position[line_break_number[p], p] = last_free_space;
				line_break_number[p]++;
				var _text_up_to_last_space = string_copy(text[p], 1, last_free_space);
				var _last_free_space_string = string_char_at(text[p], last_free_space);
				line_break_offset[p] = string_width(_text_up_to_last_space) - string_width(_last_free_space_string);
			}
		}
		
		//new verse, same as the first
		for (var c = 0; c < length_text[p]; c++)
		{
			var _character_position = c+1;
			
			var _text_x = box_x + text_x_offset[p] + border_offset;
			var _text_y = box_y + border_offset;
			
			//get width of line
			var _text_up_to_character = string_copy(text[p], 1, _character_position);
			var _current_text_width = string_width(_text_up_to_character) - string_width(character[c, p]);
			var _text_line = 0;
			
			//compensate for string breaks
			for (var lb = 0; lb < line_break_number[p]; lb++)
			{
				if _character_position >= line_break_position[lb, p]
				{
					var _string_copy = string_copy(text[p], line_break_position[lb, p], _character_position - line_break_position[lb, p]);
					_current_text_width = string_width(_string_copy);
					
					//record the line this character should be on
					_text_line = lb+1; // it normally starts on 0 so its +1
				}
			}
			//add to x & y based on the new info
			character_x[c, p] = _text_x + _current_text_width;
			character_y[c, p] = _text_y + _text_line * line_seperation;
		}
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
			//linking if options in dialogue
			if option_number > 0
			{
				create_textbox(option_link_id[option_position]);
			}
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
	
	//sdelecting
	option_position += downkey - upkey;
	option_position = clamp(option_position,0,option_number-1);
	
	//drawing
	var _option_space = 15; //vertical space between options
	var _option_border = 4; // same as textbox border
	for (var op = 0; op < option_number; op++)
	{
		var _option_width = string_width(option[op]) + _option_border*2;
		
		//box
		draw_sprite_ext(textbox_sprite, textbox_image, _textbox_x + 16,  _textbox_y - _option_space*option_number + _option_space*op, _option_width/textbox_sprite_width, (_option_space-1)/textbox_sprite_height, 0, c_white, 1 )
		
		//arrow
		if option_position == op
		{
			draw_sprite(S_dialogue_option_arrow, 0, _textbox_x, _textbox_y - _option_space*option_number + _option_space*op);
		}
		
		//text
		draw_text(_textbox_x+16+_option_border, _textbox_y - _option_space*option_number + _option_space*op+2, option[op]);
	}
}
#endregion
#region final text
//draw text
for(var c = 0; c < draw_character; c++)
{
	//the text
	draw_text(character_x[c, page], character_y[c, page], character[c, page]);
}
#endregion