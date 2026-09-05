function get_controls()
{
	rightkey = keyboard_check(vk_right) + keyboard_check(ord("D"));
		rightkey = clamp(rightkey,0,1);
	leftkey = keyboard_check(vk_left) + keyboard_check(ord("A"));
		leftkey = clamp(leftkey,0,1);
	upkey = keyboard_check(vk_up) + keyboard_check(ord("W"));
		upkey = clamp(upkey,0,1);
	downkey = keyboard_check(vk_down) + keyboard_check(ord("S"));
		downkey = clamp(downkey,0,1);
		
		
		
		
	debugkey = keyboard_check_pressed(vk_backspace) + keyboard_check_pressed(ord("L"));
		debugkey = clamp(debugkey,0,1);
}