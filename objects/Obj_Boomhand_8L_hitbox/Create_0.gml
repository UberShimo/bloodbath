event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_8L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Boomhand_8L_recovery); // 100% informational not used in logic

damage = 7;
hit_stun = global.medium_hitstun;
hit_push = 4;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 2;
v_launch = -5;

is_sticky = true;
is_launcher = true;
is_shockwave = true;
shockwave_power = 7;
shockwave_rotation = 75;

swing_sound = Snd_Light_Swing;