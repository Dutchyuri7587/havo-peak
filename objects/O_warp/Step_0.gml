if place_meeting(x, y, O_player) and !instance_exists(O_transition)
{
var _instance = instance_create_depth(0, 0, -9900, O_transition)
_instance.target_x = target_x;
_instance.target_y = target_y;
_instance.target_room = target_room;
_instance.target_face = target_face;
_instance.target_direction = target_direction;
}