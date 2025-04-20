event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_Groundsmash_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Boomhand_Groundsmash_recovery); // 100% informational not used in logic

damage = 2;
hit_stun = 20;
hit_push = 0;
freeze_duration = global.light_freeze_duration;
shake_impact = global.light_shake_impact;
h_launch = 0;
v_launch = 0;

is_projectile = true;
is_parryable = false;
is_final = true;

swing_sound = Snd_Crack;

collide = function(){
	instance_destroy();
}