event_inherited();

startup = generate_sprite_frames(Spr_Rapier_Gun_startup);
recovery = generate_sprite_frames(Spr_Rapier_Gun_recovery);

damage = 13;
hit_stun = global.light_hitstun;
hit_push = 1;
freeze_duration = global.light_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 1;
v_launch = -1;

is_projectile = true;
projectile_duration = 60;

swing_sound = Snd_Small_Explosion;

collide = function(){
	instance_destroy();
}

// Cuz it looks ugly otherwise
eff = instance_create_depth(x, y, depth, Obj_Rapier_Gunshot_fade_eff);
eff.image_xscale = image_xscale;