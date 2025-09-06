event_inherited();

startup = generate_sprite_frames(Spr_Knife_5L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Knife_5L_recovery); // 100% informational not used in logic

damage = 7;
hit_stun = global.medium_hitstun;
hit_push = 4;
freeze_duration = global.light_freeze_duration;
shake_impact = global.light_shake_impact;
h_launch = 2;
v_launch = -2;

is_sticky = true;

swing_sound = Snd_Light_Swing;