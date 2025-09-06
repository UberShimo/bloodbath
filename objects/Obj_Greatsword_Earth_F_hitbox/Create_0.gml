event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Earth_L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_Earth_L_recovery); // 100% informational not used in logic

damage = 6;
hit_stun = global.medium_hitstun;
hit_push = 8;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 4;
v_launch = -6;

is_sticky = true;
is_launcher = true;

swing_sound = Snd_Quick_Swing;
