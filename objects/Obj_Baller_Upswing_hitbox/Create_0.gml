event_inherited();

startup = generate_sprite_frames(Spr_Baller_Upswing_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Baller_Upswing_recovery); // 100% informational not used in logic

damage = 9;
hit_stun = 26;
hit_push = 4;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 1;
v_launch = -7;

is_sticky = true;
is_launcher = true;

swing_sound = Snd_Light_Swing;