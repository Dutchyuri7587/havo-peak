function SC_set_defaults_for_text()
{
	//fixes for text wrapping
	line_break_position[0, page_number] = 999; // fixes the text wrapping
	line_break_number[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	//variable speaker/boxes
	textbox_sprite[page_number] = S_dialogue_box
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
	sound[page_number] = SFX_medium;
	
	//effects
	for (var c = 0; c < 999; c++)
	{
		//coloured text
		colour_1[c, page_number] = c_white;
		colour_2[c, page_number] = c_white;
		colour_3[c, page_number] = c_white;
		colour_4[c, page_number] = c_white;
		
		//wavy text
		float_text[c, page_number] = 0;
		float_direction[c, page_number] = c*20;
		
		//shaky text
		shake_text[c, page_number] = 0;
		shake_direction[c, page_number] = irandom(360);
		shake_timer[c, page_number] = irandom(6);
	}
}

#region text VFX

//coloured text
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
		colour_1[c, page_number-1] = _col1;
		colour_2[c, page_number-1] = _col2;
		colour_3[c, page_number-1] = _col3;
		colour_4[c, page_number-1] = _col4;
	}
}

//wavy text
/// @param first character
/// @param last character
function SC_text_float(_start, _end)
{
	for (var c = _start; c <= _end; c++)
	{
		float_text[c, page_number-1] = true;
	}
}

//shaky text
/// @param first character
/// @param last character
function SC_text_shake(_start, _end)
{
	for (var c = _start; c <= _end; c++)
	{
		shake_text[c, page_number-1] = true;
	}
}

#endregion

//text function
/// @param text
/// @param [character]
/// @param [side]
function SC_text(_text)
{
	SC_set_defaults_for_text();
	
	text[page_number] = _text; //grab the text from the page your on
	
	if argument_count > 1
	{
		switch(argument[1]) //put all portraits in this switch statement
		{
			case "portrait_test":
				speaker_sprite[page_number] = S_prot_neutral; //sprite that the speaker uses
				textbox_sprite[page_number] = S_dialogue_box; //sprite that the speaker has for it's textbox
				sound[page_number] = SFX_medium; //typing sound
				break;
				
			case "portrait_test_h":
				speaker_sprite[page_number] = S_prot_happy;
				textbox_sprite[page_number] = S_dialogue_box_alt1;
				sound[page_number] = SFX_high;
				break;
				
			case "portrait_test_alt":
				speaker_sprite[page_number] = S_prot_alt_neutral;
				textbox_sprite[page_number] = S_dialogue_box_alt2;
				sound[page_number] = SFX_low;
				break;
		}
	}
	
	//which side should the speaker be on?
	if argument_count > 2
	{
		speaker_side[page_number] = argument[2];
	}
	page_number++; //go to next page
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