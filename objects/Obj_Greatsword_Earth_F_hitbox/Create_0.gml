event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Earth_F_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_Earth_F_recovery); // 100% informational not used in logic

damage = 4;
hit_stun = 32;
hit_push = 2;
freeze_duration = global.light_freeze_duration;
shake_impact = global.light_shake_impact;
h_launch = 1;
v_launch = 3;

is_sticky = true;

swing_sound = Snd_Quick_Swing;
