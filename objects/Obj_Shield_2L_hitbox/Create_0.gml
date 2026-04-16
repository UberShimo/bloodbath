event_inherited();

startup = generate_sprite_frames(Spr_Shield_2L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Shield_2L_recovery); // 100% informational not used in logic

damage = 9;
hit_stun = global.medium_hitstun;
hit_push = 2;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 1;
v_launch = -9;

is_sticky = true;
is_launcher = true;

swing_sound = Snd_Light_Swing;