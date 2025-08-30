event_inherited();

startup = generate_sprite_frames(Spr_Scythe_Birdie_startup);
recovery = generate_sprite_frames(Spr_Scythe_Birdie_recovery);

damage = 16;
hit_stun = 16;
hit_push = 0;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = 0;

is_projectile = true;
projectile_duration = 600;
collision_check_with_distance = false;

swing_sound = Snd_NOTHING;

// Birdie stuff
acceleration = 0;
v_control = 0.075;
depth = -5;

collide = function(){
	if(place_meeting(x+h_velocity, y, Parent_Collision)){
		spawn_effect(x, y, 1, Eff_Ring, 1, 0.1, c_white, 0.5, 0.5, 0.1);
		instance_destroy();
	}
	// Bounce
	else{
		v_velocity *= -0.1;
	}
}