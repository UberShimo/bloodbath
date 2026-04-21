event_inherited();

startup = generate_sprite_frames(Spr_Shield_Projectile_Trick_startup);
recovery = generate_sprite_frames(Spr_Shield_Projectile_Trick_recovery);

damage = 8;
hit_stun = 16;
hit_push = 0;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 0;
v_launch = 0;

is_projectile = true;
projectile_duration = 60;
collision_check_with_distance = false;

swing_sound = Snd_NOTHING;

v_velocity = -3;
weight = 0.1;
image_blend = c_yellow;

// Shield projectile stuff
is_fired = false;

collide = function(){
	v_velocity = 1;
	
	if(is_fired){
		instance_destroy();
	}
}