event_inherited();

startup = generate_sprite_frames(Spr_Bow_5F_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Bow_5F_recovery); // 100% informational not used in logic

damage = 6;
hit_stun = 16;
hit_push = -5;
freeze_duration = 8;
h_launch = -1;
v_launch = -1;

is_sticky = true;
hit_effect_y = -8;

swing_sound = Snd_Light_Swing;