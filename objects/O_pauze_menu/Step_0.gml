get_controls();

op_length = array_length(option[menu_level]); //store the amount of options in current menu 

//keep the line, keep the line, moving! (move through options)
position += (downkeypress - upkeypress);
if position >= op_length {position = 0};
if position < 0 {position = op_length-1};

//use the option
if acceptkey
{
	var _ogmenulvl = menu_level;
	
	switch(menu_level)
	{
		case 0:
			switch(position)
			{
				case 0: //blammed
					
				break;
				case 1: //settings
					menu_level = 1;
				break;
				case 2: //quit
					game_end();
				break;
			}
		break;
		case 1:
			switch(position)
			{
				case 0:
					show_message("test 1");
				break;
				case 1:
					show_message("test 2");
				break;
				case 2:
					show_message("test 3");
				break;
				case 3:
					menu_level = 0;
				break;
			}
		break;
	}
	//set back position to not crash game accidentally
	if _ogmenulvl != menu_level {position = 0};
	//correct option length
	op_length = array_length(option[menu_level]); 
}
