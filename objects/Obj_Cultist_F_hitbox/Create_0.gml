event_inherited();

startup = generate_sprite_frames(Spr_Cultist_F_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Cultist_F_recovery); // 100% informational not used in logic

damage = 2;
hit_stun = global.light_hitstun;
hit_push = 8;
freeze_duration = global.light_freeze_duration;
shake_impact = global.light_shake_impact;
h_launch = 0;
v_launch = 0;

is_shockwave = true;
shockwave_power = 8;
active_frames = 2;

swing_sound = Snd_Light_Swing;