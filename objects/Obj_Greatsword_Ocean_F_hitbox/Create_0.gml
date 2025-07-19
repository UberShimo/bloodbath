event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Ocean_F_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_Ocean_F_recovery); // 100% informational not used in logic

damage = 5;
hit_stun = 24;
hit_push = 1;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 1;
v_launch = -1;

is_sticky = true;

swing_sound = Snd_Quick_Swing;
hit_sound = Snd_Knack;