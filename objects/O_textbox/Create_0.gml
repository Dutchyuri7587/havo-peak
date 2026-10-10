get_controls();
depth = -1000000;
#region dimensions
textbox_width = 156;
textbox_height = 48;

border_offset = 8;
line_seperation = 12;
line_width = (textbox_width - border_offset*2);

camera_offset_x = 0;
camera_offset_y = 128;

//for animating
textbox_sprite = S_dialogue_box;
textbox_image = 0;
textbox_image_speed = 1/60; // speed moet zijn de fps van de sprite gedeeld door 60 (de game's fps)
#endregion

#region text
page = 0;
text[0] = "a";
length_text[0] = string_length(text[0]);

draw_character = 0; // how many characters have been drawn (for typing effect
speed_text = 1;

setup = false;

nof_pages = 0;
#endregion

#region dialogue
text[1] = "this is some test dialogue, hey tim, hoe gaat ie lmao"
text[2] = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa dit is om te kijken hoe lange text werkt aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
text[3] = "short king"
#endregion