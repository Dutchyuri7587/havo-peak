function SC_set_defaults_for_text()
{
	line_break_position[0, nof_pages] = 999; // fixes the text wrapping
	line_break_number[nof_pages] = 0;
	line_break_offset[nof_pages] = 0;
	
	textbox_sprite[nof_pages] = S_dialogue_box
	speaker_sprite[nof_pages] = noone;
	speaker_side[nof_pages] = 1;
	sound[nof_pages] = SFX_medium;
	
	//vars for every character/letter
	for (var c = 0; c < 999; c++)
	{
		colour_1[c, nof_pages] = c_white;
		colour_2[c, nof_pages] = c_white;
		colour_3[c, nof_pages] = c_white;
		colour_4[c, nof_pages] = c_white;
	}
}

#region text VFX

/// @param first_char
/// @param last_char
/// @param colour_1
/// @param colour_2
/// @param colour_3
/// @param colour_4
function SC_text_coloured(_start, _end, _col1, _col2, _col3, _col4)
{
	for (var c = _start; c <= _end; c++)
	{
		colour_1[c, nof_pages-1] = _col1;
		colour_2[c, nof_pages-1] = _col2;
		colour_3[c, nof_pages-1] = _col3;
		colour_4[c, nof_pages-1] = _col4;
	}
}

#endregion


/// @param text
/// @param [character]
/// @param [side]
function SC_text(_text)
{
	
	SC_set_defaults_for_text();
	
	text[nof_pages] = _text;
	
	
	if argument_count > 1
	{
		switch(argument[1])
		{
			case "portrait_test":
				speaker_sprite[nof_pages] = S_prot_neutral;
				textbox_sprite[nof_pages] = S_dialogue_box;
				sound[nof_pages] = SFX_medium;
				break;
			case "portrait_test_h":
				speaker_sprite[nof_pages] = S_prot_happy;
				textbox_sprite[nof_pages] = S_dialogue_box_alt1;
				sound[nof_pages] = SFX_high;
				break;
				
			case "portrait_test_alt":
				speaker_sprite[nof_pages] = S_prot_alt_neutral;
				textbox_sprite[nof_pages] = S_dialogue_box_alt2;
				sound[nof_pages] = SFX_low;
				break;
		}
	}
	
	//which side
	if argument_count > 2
	{
		speaker_side[nof_pages] = argument[2];
	}
	
	nof_pages++;
}

///@param option
///@param link_id
function SC_option(_option, _link_id)
{
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;
}


///@param text_id
function create_textbox (_text_id)
{
	with (instance_create_depth(0,0,-999999,O_textbox))
	{
		SC_game_dialogue(_text_id);
	}
}