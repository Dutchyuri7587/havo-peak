get_controls();

if debugkey
{
	on = true;
}

if on
{
	if keyboard_check_pressed(ord("1"))
	{
		room_goto(R_test);
		O_player.x = 240;
		O_player.y = 156;
	}
	if keyboard_check_pressed(ord("P"))
	{
		O_hitbox.visible = true;
		O_music_zone.visible = true;
		O_warp.visible = true;
	}
	if keyboard_check_pressed(ord("O"))
	{
		O_hitbox.visible = false;
		O_music_zone.visible = false;
		O_warp.visible = false;
	}
}