event_inherited();

startup = generate_sprite_frames(Spr_Batman_Spinhop_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_Spinhop_recovery); // 100% informational not used in logic

damage = 14;
hit_stun = global.heavy_hitstun;
hit_push = 0;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 0;
v_launch = 0;

is_sticky = true;
is_shockwave = true;
shockwave_power = 6;
shockwave_rotation = -20;

swing_sound = Snd_Light_Swing;