event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_5L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_5L_recovery); // 100% informational not used in logic

damage = 14;
hit_stun = global.heavy_hitstun;
hit_push = 8;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 3;
v_launch = -5;

is_sticky = true;
hit_effect_y = -8;

swing_sound = Snd_Light_Swing;