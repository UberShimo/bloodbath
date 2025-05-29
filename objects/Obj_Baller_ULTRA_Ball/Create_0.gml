event_inherited();

damage = 10;
hit_stun = 8;
hit_push = 0;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = 4;

swing_sound = Snd_NOTHING;
hit_sound = Snd_Crack;

is_projectile = true;
is_parryable = false;
swing_sound = Snd_NOTHING;
collision_check_with_distance = true;
collision_check_distance = 16;
projectile_duration = 180; // 3 sec
weight = 0.3;

image_angle = point_direction(0, 0, h_velocity, v_velocity);

collide = function(){
	// Bounce
	if(position_meeting(x+h_velocity, y, Parent_Collision)){
		h_velocity *= -0.8;
		x += h_velocity;
	}
	if(position_meeting(x, y+v_velocity, Parent_Collision)){
		v_velocity *= -0.8;
		y += v_velocity;
	}
}
