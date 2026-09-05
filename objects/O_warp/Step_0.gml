if place_meeting(x, y, O_player) and !instance_exists(O_transition)
{
var instance = instance_create_depth(0, 0, -9900, O_transition)
instance.target_x = target_x
instance.target_y = target_y
instance.target_room = target_room
instance.target_face = target_face;
}