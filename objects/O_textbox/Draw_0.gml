box_x = camera_get_view_x(view_camera[0]) + camera_offset_x;
box_y = camera_get_view_y(view_camera[0]) + camera_offset_y;

if !setup
{
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
}