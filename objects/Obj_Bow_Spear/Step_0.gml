event_inherited();

eff = instance_create_depth(x, y, depth, Obj_Bow_Arrow_fade_eff);
eff.image_xscale = image_xscale;
eff.image_angle = image_angle;
eff.image_blend = c_lime;

if(instance_exists(attachment)){
	is_active = false; 
	x = attachment.x+(att_x_dist*attachment.image_xscale);
	y = attachment.y+att_y_dist;
	image_angle = attachment.image_angle+att_angle_diff;
	
	if(attachment.image_xscale != att_original_xscale){
		image_xscale = -original_xscale;
		image_angle = attachment.image_angle-att_angle_diff;
	}
	else{
		image_xscale = original_xscale;
	}
}

// Angle the spear
if(is_active){
	image_angle = point_direction(0, 0, h_velocity, v_velocity);
}