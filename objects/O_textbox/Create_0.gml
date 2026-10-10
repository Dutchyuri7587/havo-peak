#region dimensions
textbox_width = 48;
textbox_height = 36;

border_offset = 8;
line_seperation = 12;
line_width = (textbox_width - border_offset*2);

camera_offset_x = 64;
camera_offset_y = 64;
#endregion

#region text
page = 0;
text[0] = "";
length_text[0] = string_length(text[0]);

draw_character = 0; // how many characters have been drawn (for typing effect
speed_text = 1;

setup = false;
#endregion