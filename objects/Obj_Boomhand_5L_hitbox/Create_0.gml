event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_5L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Boomhand_5L_recovery); // 100% informational not used in logic

damage = 8;
hit_stun = 24;
hit_push = 5;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 2.5;
v_launch = -5;

is_sticky = true;
hit_effect_y = -8;

swing_sound = Snd_Light_Swing;
