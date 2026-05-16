
event_inherited();

if(instance_exists(targeted_pose)){
	color = targeted_pose.image_blend;
	dir = point_direction(x, y, targeted_pose.x, targeted_pose.y);
	draw_sprite_ext(Spr_Shield_Pose_Dash_Indicator, 0, x, y, object_scale, object_scale, dir, color, image_alpha);
}