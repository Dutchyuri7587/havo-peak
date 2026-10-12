var _self = id;

if position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left)
{
	with (instance_create_depth(0,0,-999999,O_textbox))
	{
		SC_game_dialogue(_self.text_id);
	}
}