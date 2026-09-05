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
if rightkey
{
	face = 1
	x += Xspeed
}
if leftkey
{
	face = -1
	x += Xspeed
}
if upkey
{
	y += Yspeed
}
if downkey
{
	y += Yspeed
}
#endregion