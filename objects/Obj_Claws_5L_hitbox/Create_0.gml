event_inherited();

startup = generate_sprite_frames(Spr_Claws_5L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Claws_5L_recovery); // 100% informational not used in logic

damage = 5;
hit_stun = 16;
hit_push = 4;
freeze_duration = 8;
h_launch = 1;
v_launch = -4;

is_sticky = true;

swing_sound = Snd_Light_Swing;