event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Wavekick_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_Wavekick_recovery); // 100% informational not used in logic

damage = 0;
hit_stun = 0;
hit_push = 0;
freeze_duration = 0;
h_launch = 0;
v_launch = 0;

is_active = false;
is_projectile = true;
projectile_duration = 600;
is_final = true;
collision_check_with_distance = false;

// Wave stuff
drag_along_amount = 0.8; // % based

collide = function(){
	if(place_meeting(x+h_velocity, y, Parent_Collision)){
		spawn_effect(x, y, 1, Eff_Ring, 1, 0.1, c_aqua, 1, 1, 0.2);
		instance_destroy();
	}
	if(place_meeting(x, y+v_velocity, Parent_Collision)){
		sprite_index = Spr_Greatsword_Wave;
		v_velocity = 0;
	}
}