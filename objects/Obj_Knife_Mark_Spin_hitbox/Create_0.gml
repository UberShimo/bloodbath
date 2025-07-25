event_inherited();

startup = generate_sprite_frames(Spr_Knife_Mark_Spin_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Knife_Mark_Spin_recovery); // 100% informational not used in logic

damage = 6;
hit_stun = 24;
hit_push = 0;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 0;
v_launch = 0;

is_sticky = true;
is_shockwave = true;
shockwave_power = 2;
active_frames = 16;

swing_sound = Snd_Light_Swing;