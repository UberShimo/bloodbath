event_inherited();

startup = generate_sprite_frames(Spr_Batman_Pitch_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_Pitch_recovery); // 100% informational not used in logic

meter_gain_multiplier = 0;
projectile_duration = 480; // 8 sec
has_hit_enemy = false;
minimum_bounce_velocity = 4;

image_blend = c_lime;

collide = function(){
	// Bounce
	if(position_meeting(x+h_velocity, y, Parent_Collision)){
		h_velocity *= -0.8;
		x += h_velocity;
		if(get_velocity() < minimum_bounce_velocity){
			h_velocity *= 1.4;
		}
	}
	if(position_meeting(x, y+v_velocity, Parent_Collision)){
		v_velocity *= -0.8;
		y += v_velocity;
		if(get_velocity() < minimum_bounce_velocity){
			v_velocity *= 1.4;
		}
	}
}