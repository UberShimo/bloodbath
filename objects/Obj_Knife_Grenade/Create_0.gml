event_inherited();

startup = generate_sprite_frames(Spr_Knife_Grenade_Lob_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Knife_Grenade_Lob_recovery); // 100% informational not used in logic

depth = -3;

is_projectile = true;
is_cancelable = true;
weight = 0.3;
collision_check_with_distance = false;

is_active = false;
priority_struck = false;
priority_struck_alarm = 0;
collision_protection = 10; // 10 frames of cant hit opponent

hitbox_list = ds_list_create();
detonation_timer = 150;

collide = function(){// Bounce
	if(place_meeting(x+h_velocity, y, Parent_Collision)){
		h_velocity *= -1;
	}
	if(place_meeting(x, y+v_velocity, Parent_Collision)){
		v_velocity *= -1;
		// Stop if velocity is super low
		if(get_velocity() < 1){
			h_velocity = 0;
			v_velocity = 0;
		}
	}
	// Reduce velocity
	h_velocity *= 0.4;
	v_velocity *= 0.4;
}