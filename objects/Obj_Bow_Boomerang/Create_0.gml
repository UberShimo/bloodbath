event_inherited();

startup = generate_sprite_frames(Spr_Bow_Boomerang_Throw_startup);
recovery = generate_sprite_frames(Spr_Bow_Boomerang_Throw_recovery);

damage = 4;
hit_stun = 16;
hit_push = 0;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 0;
v_launch = 0;

is_projectile = true;
is_final = true;

swing_sound = Snd_Light_Swing;
hit_sound = Snd_Knack;

velocity_friction = 0.2;

is_returning = false;
is_possessed = false;
target = noone;
return_alarm = 100;
return_acceleration = 0.5;
can_be_cought = false;
can_be_cought_alarm = 30;
max_duration = 600; // 10 sec

collide = function(){
	// Bounce
	if(position_meeting(x+h_velocity, y, Parent_Collision)){
		h_velocity = h_velocity*-0.8;
		x -= h_velocity;
	}
	if(position_meeting(x, y+v_velocity, Parent_Collision)){
		v_velocity = v_velocity*-0.8;
		y -= v_velocity;
	}
}