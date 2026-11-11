get_controls();

//set your direction
Xspeed = (rightkey - leftkey) * movespeed;
Yspeed = (downkey - upkey) * movespeed;

#region collision
//if im gonna hit something on my x on my next step, stop moving in x.
if place_meeting(x+Xspeed,y,O_hitbox)
{
	Xspeed = 0;
}
//if im gonna hit something on my y on my next step, stop moving in y.
if place_meeting(x,y+Yspeed,O_hitbox)
{
	Yspeed = 0;
}
#endregion

#region movement
if !immobile //if im not in dialogue
{
	if rightkey
	{
		face = 1;
		direction_p = 1;
		x += Xspeed;
	}
	if leftkey
	{
		face = -1;
		direction_p = 2;
		x += Xspeed;
	}
	if upkey
	{
		direction_p = 3;
		y += Yspeed;
	}
	if downkey
	{
		direction_p = 4;
		y += Yspeed;
	}
}
#endregion

#region interaction
if acceptkey && !immobile
{
	interact_timer = interact_time;//setup the timer
	if direction_p == 1 //right
	{
		instance_create_depth(x+8, y-8, -50, O_interacter);
	}
	if direction_p == 2 //left
	{
		instance_create_depth(x-8, y-8, -50, O_interacter);
	}
	if direction_p == 3 //up
	{
		instance_create_depth(x, y-16, -50, O_interacter);
	}
	if direction_p == 4 // down
	{
		instance_create_depth(x, y+8, -50, O_interacter);
	}
	
}

//countdown the timer
if interact_timer > 0
{
	interact_timer--;
}
#endregion

#region menu
if menukey && !immobile
{
	instance_create_depth(x,y,-100000,O_pauze_menu);
	immobile = true;
}
#endregion