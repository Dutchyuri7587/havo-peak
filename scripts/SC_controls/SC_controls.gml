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
	
	rightkeypress = keyboard_check_pressed(vk_right) + keyboard_check_pressed(ord("D"));
		rightkeypress = clamp(rightkeypress,0,1);
	leftkeypress = keyboard_check_pressed(vk_left) + keyboard_check_pressed(ord("A"));
		leftkeypress = clamp(leftkeypress,0,1);
	upkeypress = keyboard_check_pressed(vk_up) + keyboard_check_pressed(ord("W"));
		upkeypress = clamp(upkeypress,0,1);
	downkeypress = keyboard_check_pressed(vk_down) + keyboard_check_pressed(ord("S"));
		downkeypress = clamp(downkeypress,0,1);
		
	debugkey = keyboard_check_pressed(vk_backspace) + keyboard_check_pressed(ord("L"));
		debugkey = clamp(debugkey,0,1);
	acceptkey = keyboard_check_pressed(ord("Z"));
		acceptkey = clamp(acceptkey,0,1);
	menukey = keyboard_check_pressed(ord("X"));
		menukey = clamp(menukey,0,1);
}