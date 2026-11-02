function SC_set_defaults_for_text()
{
	line_break_position[0, nof_pages] = 999; // fixes the text wrapping
	line_break_number[nof_pages] = 0;
	line_break_offset[nof_pages] = 0;
	
	textbox_sprite[nof_pages] = S_dialogue_box
	speaker_sprite[nof_pages] = noone;
	speaker_side[nof_pages] = 1;
}

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
				break;
			case "portrait_test_h":
				speaker_sprite[nof_pages] = S_prot_happy;
				textbox_sprite[nof_pages] = S_dialogue_box_alt1;
				break;
				
			case "portrait_test_alt":
				speaker_sprite[nof_pages] = S_prot_alt_neutral;
				textbox_sprite[nof_pages] = S_dialogue_box_alt2;
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