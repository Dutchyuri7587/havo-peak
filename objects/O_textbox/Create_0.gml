get_controls();
depth = -1000000;
#region parameters
textbox_width = 156;
textbox_height = 48;

border_offset = 4; //padding in hoogte en breedte van text vergeleken met de textbox
line_seperation = 10; //hoe ver verticaal zinnen van elkaar afgaan
line_width = (textbox_width - border_offset*2); // hoe ver een zin kan gaan totdat het een enter doet

camera_offset_x = 0;
camera_offset_y = 128; //offset van de texbox vanaf het midden van het scherm

//for animating
//dit is los zodat de textbox los genanimeerd kan zijn van de rest van de text/emotion sprites
textbox_sprite[0] = S_dialogue_box;
textbox_image = 0;
textbox_image_speed = 1/60; //speed moet zijn de fps van de sprite gedeeld door 60 (de game's fps) (1 fps is dus 1/60)
#endregion

#region text
page = 0;
text[0] = "";
length_text[0] = string_length(text[0]);

draw_character = 0; //how many characters have been drawn (for typing effect)
speed_text = 1; //How many characters the typing effect progresses with at once

setup = false; //has the textbox been setup?

page_number = 0; //the page the textbox is on

character[0, 0] = "";
character_x[0, 0] = 0;
character_y[0, 0] = 0;
#endregion

#region options
option[0] = ""; //the option you choose
option_link_id[0] = -1; //which dialogue to link to via options

option_position = 0; //position of the option
option_number = 0; //which option is it?
#endregion

#region sound
sound_delay = 4; //amount of frames between typing sounds
sound_count = sound_delay; //frame counter to check how long its been since last typing sound
#endregion

#region effects
SC_set_defaults_for_text();
last_free_space = 0;
text_pause_timer = 0;
text_pause_time = 16; //how many frames should the typer pause after a pause character
#endregion

O_player.immobile = true; //this sets the player to be in dialogue the moment the textbox gets made