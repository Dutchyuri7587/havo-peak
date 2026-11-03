///@param text_id
function SC_game_dialogue(_text_id)
{
	switch(_text_id)
	{
		#region example/test
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
		
		case "example_colours":
			SC_text("Tim, I remember you're...... BI-CURIOUSES", "portrait_test_alt", -1);
				SC_text_coloured(0,3,c_red,c_red,c_red,c_red);
				SC_text_coloured(29,41,c_purple,c_purple,c_purple,c_purple)
		break;
		#endregion
	}
}