event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_Shockwave_Punch_startup);
recovery = generate_sprite_frames(Spr_Boomhand_Shockwave_Punch_recovery);

damage = 3;
hit_stun = global.light_hitstun;
hit_push = 0;
freeze_duration = 1;
extra_freeze_duration = global.medium_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = 0;

is_projectile = true;
is_final = true;
is_parryable = false;


visible = false; // INVISIBLE PROJECTILE!
 // Initiate first shockwave effect.
eff = instance_create_depth(x, y, depth, Obj_Boomhand_Shockwave_decay_eff);
eff.initiate(self);

swing_sound = Snd_Crack;
hit_sound = Snd_NOTHING;

collide = function(){
	instance_destroy();
}