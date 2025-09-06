event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_8F_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Boomhand_8F_recovery); // 100% informational not used in logic

damage = 7;
hit_stun = global.light_hitstun;
hit_push = 4;
freeze_duration = global.light_freeze_duration;
shake_impact = global.light_shake_impact;
h_launch = 5;
v_launch = -2;

is_sticky = true;

swing_sound = Snd_Quick_Swing;
