///@param text_id
function SC_game_dialogue(_text_id)
{
	switch(_text_id) //PUT ALL DIALOGUE IN THIS SWITCH STATEMENT
	{
		#region example/test dialogue
		case "example":
			SC_text("This is an example of some dialogue from the game dialogue script!");
			SC_text("This is a second line");
			break;
			
		case "example_2":
			SC_text("This is another example, how are you doing today?");
			SC_text("This is a second line^2");
			break;
			
		case "example_3":
			SC_text("You will have 2 options, choose correctly. Or else.");
				SC_option("option 1!!", "option 1")
				SC_option("option 2!!!!!", "option 2")
			break;
			case "option 1":
				SC_text("Correct!");
				break;
			case "option 2":
				SC_text("Wrong, no more free ham sandwhich day for you!");
				break;
		
		case "example_portrait":
			SC_text("Woah! I have an actual face now!", "portrait_test");
			SC_text("Pretty snazzy icl", "portrait_test");
			SC_text("testing without portrait");
			break;
			
		case "example_portrait_h":
			SC_text("I'm happy!", "portrait_test_h");
			SC_text("Did you notice that? You can tell by the fact my eyes are closed upwards!!!!", "portrait_test_h");
			break;
		
		case "example_portrait_evil":
			SC_text("Someone replaced my colours :(", "portrait_test_alt", -1);
			SC_text("This makes me sad DDDDDDD:", "portrait_test_alt", -1);
			break;
		
		case "example_vfx":
			SC_text("Tim, I remember you're... BI-CURIOUSES", "portrait_test_alt", -1);
				SC_text_coloured(0,3,c_red,c_red,c_red,c_red);
				SC_text_coloured(26,39,c_purple,c_purple,c_purple,c_purple)
			SC_text("WoooOOoooOOoooooOOOOo!", "portrait_test_h", 1);
				SC_text_float(0,26);
			SC_text("We don't have capital letters dingus.", "portrait_test_alt", -1);
				SC_text_shake(30, 36);
			break;
			
		case "example_showoff":
			SC_text("Yo! This is a conversation that'll show off all the new effects n shit!", "portrait_test", 1);
			SC_text("I can be happy! You'll notice that my sfx changes when my expression changes.", "portrait_test_h", 1);
			SC_text("Every portrait can have it's own noise.", "portrait_test_h", 1);
			SC_text("The portrait can also switch sides!", "portrait_test_alt", -1);
			SC_text("I can also have Crazy Super Cool effects inside the dialogue!", "portrait_test", 1);
				SC_text_coloured(16,21,c_red, c_red, c_red, c_red);
				SC_text_float(22, 27);
				SC_text_shake(28, 32);
			SC_text("You don't have to use a speaker!");
				SC_text_float(10,14)
			SC_text("You can also make choices, which makes it so you can have actual conversations.");
			SC_text("Isn't that cool?");
				SC_option("Yes", "example_ch_yes");
				SC_option("No", "example_ch_no");		
				break;
				case "example_ch_yes":
					SC_text("Great!");
					break;
				case "example_ch_no":	
					SC_text("Oh.....");
					break;
		#endregion
	}
}