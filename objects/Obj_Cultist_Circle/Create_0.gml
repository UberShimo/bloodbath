event_inherited();

is_active = false;
is_projectile = true;
is_cancelable = true;
collision_check_with_distance = false;

velocity_friction = 0.16;

implode_alarm = 0;
destroy_alarm = 0;
is_meter_circle = false;

mask_index = Spr_Cultist_Circle;

hitbox_list = ds_list_create();

collide = function(){
	// Bounce
	if(place_meeting(x+h_velocity, y, Parent_Collision)){
		h_velocity *= -0.8;
		x += h_velocity;
	}
	if(place_meeting(x, y+v_velocity, Parent_Collision)){
		v_velocity *= -0.8;
		y += v_velocity;
	}
}