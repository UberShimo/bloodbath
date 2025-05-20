event_inherited();

startup = generate_sprite_frames(Spr_Dojo_Stab_Projectile_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Dojo_Stab_Projectile_recovery); // 100% informational not used in logic

damage = 12;
hit_stun = 16;
hit_push = 5;
freeze_duration = global.light_freeze_duration;
shake_impact = global.light_shake_impact;
h_launch = 1;
v_launch = -4;

is_projectile = true;
projectile_duration = 120;

swing_sound = Snd_NOTHING;

collide = function(){
	spawn_effect(x+8*image_xscale, y, 1, Eff_Ring, 1, 0.1, c_red, 0.2, 0.2, 0.2);
	instance_destroy();
}