event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_Groundsmash_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Boomhand_Groundsmash_recovery); // 100% informational not used in logic

damage = 2;
hit_stun = 20;
hit_push = 0;
freeze_duration = 2;
extra_freeze_duration = 8;
h_launch = 0;
v_launch = 0;

is_projectile = true;
is_parryable = false;
is_final = true;
shake_amount = 2;

swing_sound = Snd_Knack;

collide = function(){
	instance_destroy();
}