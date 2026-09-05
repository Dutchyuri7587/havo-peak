get_controls();

if debugkey
{
	on = true;
}


if on
{
	if keyboard_check_pressed(ord("P"))
	{
		O_hitbox.visible = true;
	}
	if keyboard_check_pressed(ord("O"))
	{
		O_hitbox.visible = false;
	}
}