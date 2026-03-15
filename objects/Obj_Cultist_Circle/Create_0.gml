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
	// Security thing to get circle out of walls
	if(place_meeting(x, y, Parent_Collision)){
		collision = instance_nearest(x, y, Parent_Collision);
		dir = point_direction(collision.x, collision.y, x, y);
		x += lengthdir_x(2, dir);
		y += lengthdir_y(2, dir);
	}
}