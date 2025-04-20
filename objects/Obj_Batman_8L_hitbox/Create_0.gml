event_inherited();

startup = generate_sprite_frames(Spr_Batman_8L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_8L_recovery); // 100% informational not used in logic

damage = 7;
hit_stun = 24;
hit_push = 4;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 1;
v_launch = -8;

is_sticky = true;
is_launcher = true;

swing_sound = Snd_Light_Swing;