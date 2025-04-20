event_inherited();

startup = generate_sprite_frames(Spr_Katana_5L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Katana_5L_recovery); // 100% informational not used in logic

damage = 10;
hit_stun = 20;
hit_push = 5;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 1;
v_launch = -4;

is_sticky = true;

swing_sound = Snd_Light_Swing;