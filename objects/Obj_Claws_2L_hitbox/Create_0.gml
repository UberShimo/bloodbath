event_inherited();

startup = generate_sprite_frames(Spr_Claws_8L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Claws_8L_recovery); // 100% informational not used in logic

damage = 9;
hit_stun = global.heavy_hitstun;
hit_push = 3;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 2;
v_launch = -5;

is_sticky = true;
is_shockwave = true;
shockwave_power = 6;
shockwave_rotation = -60;

swing_sound = Snd_Light_Swing;