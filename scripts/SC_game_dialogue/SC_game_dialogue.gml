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
				SC_option("option 1", "option 1")
				SC_option("option 2", "option 2")
		break;
			case "option 1":
				SC_text("Correct!");
			break;
			case "option 2":
				SC_text("Wrong, no more free ham sandwhich day for you!");
			break;
		#endregion
	}
}
