event_inherited();

startup = generate_sprite_frames(Spr_Shield_Cool_Shot_startup);
recovery = generate_sprite_frames(Spr_Shield_Cool_Shot_recovery);

damage = 2;
hit_stun = 90;
hit_push = 0;
freeze_duration = 0;
shake_impact = 0;
h_launch = 0;
v_launch = 0;

is_projectile = true;
projectile_duration = 600;
collision_check_with_distance = false;
is_final = true;

swing_sound = Snd_Silent_Plopp;
hit_sound = Snd_Knack;

collide = function(){
	spawn_effect(x, y, 1, Eff_Ring, 1, 0.1, c_aqua, 0.5, 0.5, 0.2);
	instance_destroy();
}

extra_hit_logic = function(target){
	target.image_blend = c_aqua;
}