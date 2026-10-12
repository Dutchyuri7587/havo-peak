///@param text_id
function SC_game_dialogue(_text_id)
{
	switch(_text_id)
	{
		case "example":
			SC_text("This is an example of some dialogue from the game dialogue script!");
			SC_text("This is a second line");
		break;
		case "example_2":
			SC_text("This is another example, how are you doing today?");
			SC_text("This is a second line^2");
		break;
	}
}