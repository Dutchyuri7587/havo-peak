/// @param text
function SC_text(_text)
{
	text[nof_pages] = _text;
	
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