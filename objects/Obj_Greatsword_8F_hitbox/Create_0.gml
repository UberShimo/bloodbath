event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_8F_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_8F_recovery); // 100% informational not used in logic

damage = 3;
hit_stun = 16;
hit_push = 4;
freeze_duration = global.light_freeze_duration;
shake_impact = global.light_shake_impact;
h_launch = 1;
v_launch = -5;

is_sticky = true;

swing_sound = Snd_Quick_Swing;