get_controls();

Xspeed = (rightkey - leftkey) * movespeed;
Yspeed = (downkey - upkey) * movespeed;

#region collision
if place_meeting(x+Xspeed,y,O_hitbox)
{
	Xspeed = 0;
}
if place_meeting(x,y+Yspeed,O_hitbox)
{
	Yspeed = 0;
}
#endregion

#region movement
if !in_dialogue
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
if acceptkey && !in_dialogue
{
	interact_timer = interact_time;
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

if interact_timer > 0
{
	interact_timer--;
}
#endregion