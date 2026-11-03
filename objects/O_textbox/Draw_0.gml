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
		
		//how many characters are on each page
		length_text[p] = string_length(text[p]);
		
		
		//get x position for textbox
			//speaker on the left
			text_x_offset[p] = 72;
			portrait_x_offset[p] = 24;
			
			
			//speaker on the right
			if speaker_side[p] == -1
			{
				text_x_offset[p] = 24;
				portrait_x_offset[p] = 186;
			}
		
		
			//if there is no speaker
			if speaker_sprite[p] == noone
			{
				text_x_offset[p] = 42; // this one is a general x offset for both dialogue and textbox
			}
		
		
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
if text_pause_timer <= 0
{
	
	
	if draw_character < length_text[page]
	{
		
		
		draw_character += speed_text;
		draw_character = clamp(draw_character,0,length_text[page]);
		var _check_character = string_char_at(text[page], draw_character);
		if _check_character == "." || _check_character == "?" || _check_character == "!" || _check_character == ","
		{
			text_pause_timer = text_pause_time;
			if ! audio_is_playing(sound[page])
			{
				audio_play_sound(sound[page], 7, false);
			}
		}
		else
		{
			//type sound
			if sound_count < sound_delay
			{
				sound_count++;
			}
			else
			{
				sound_count = 0;
				audio_play_sound(sound[page], 5, false);
			}
		}
		
	}
}
else
{
	text_pause_timer--;
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
textbox_sprite_width = sprite_get_width(textbox_sprite[page]);
textbox_sprite_height = sprite_get_height(textbox_sprite[page]);

//speaker portrait
if speaker_sprite[page] != noone
{
	sprite_index = speaker_sprite[page];
	if draw_character == length_text[page] {image_index = 0};
	var _speaker_x = box_x + portrait_x_offset[page];
	if speaker_side[page] == -1 {_speaker_x += sprite_width};
	//draw speaker
	draw_sprite_ext(textbox_sprite[page], textbox_image, box_x + portrait_x_offset[page], box_y, sprite_width/textbox_sprite_width, sprite_height/textbox_sprite_height, 0, c_white, 1); // box
	draw_sprite_ext(sprite_index, image_index, _speaker_x, box_y, speaker_side[page], 1, 0, c_white, 1);
}

//back of textbox
draw_sprite_ext
(
textbox_sprite[page], 
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
		draw_sprite_ext(textbox_sprite[page], textbox_image, _textbox_x + 16,  _textbox_y - _option_space*option_number + _option_space*op, _option_width/textbox_sprite_width, (_option_space-1)/textbox_sprite_height, 0, c_white, 1 )
		
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
	//////-----some bullshit (special stuff)------/////
	//floating text
	var _float_y = 0;
	if float_text[c, page] == true
	{
		float_direction[c, page] += -6;
		_float_y = dsin(float_direction[c, page])
	}
	
	//the text
	draw_text_colour(character_x[c, page], character_y[c, page] + _float_y, character[c, page], colour_1[c, page], colour_2[c, page], colour_3[c, page], colour_4[c, page], 1);
}
#endregion