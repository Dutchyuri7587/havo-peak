get_controls();
depth = -1000000;
#region dimensions
textbox_width = 156;
textbox_height = 48;

border_offset = 4; // padding in hoogte en breedte van text vergeleken met de textbox
line_seperation = 10; // hoe ver in hoogte zinnen van elkaar afgaan
line_width = (textbox_width - border_offset*2); // hoe ver een zin kan gaan totdat het een enter doet

camera_offset_x = 0;
camera_offset_y = 128;

//for animating
//dit is los zodat de textbox los genanimeerd kan zijn van de rest van de text/emotion sprites
textbox_sprite = S_dialogue_box;
textbox_image = 0;
textbox_image_speed = 1/60; // speed moet zijn de fps van de sprite gedeeld door 60 (de game's fps)
#endregion

#region text
page = 0;
text[0] = "";
length_text[0] = string_length(text[0]);

draw_character = 0; // how many characters have been drawn (for typing effect)
speed_text = 1; // take a wild fucking guess

setup = false;

nof_pages = 0;
#endregion

#region dialogue
/*
text[1] = "this is some test dialogue, hey tim, hoe gaat ie lmao"
text[2] = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa dit is om te kijken hoe lange text werkt aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa boe"
text[3] = "short king"
text[4] = "a aa aaa aaaa aaaaa aaazasaaaa "
text[5] = "Dit is een lange text met correcte spaties n shit. Ik hoop dat de spacing hier wel goed werkt :D"*/
#endregion