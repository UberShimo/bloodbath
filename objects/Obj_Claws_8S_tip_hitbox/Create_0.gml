event_inherited();

startup = generate_sprite_frames(Spr_Claws_8S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Claws_8S_recovery); // 100% informational not used in logic

damage = 6;
hit_stun = 32;
hit_push = 4;
freeze_duration = 16;
h_launch = 0;
v_launch = 15;

shake_amount = 4;
is_priority = true;
is_sticky = true;

hit_sound = Snd_Crack;