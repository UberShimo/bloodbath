event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Stomp_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_Stomp_recovery); // 100% informational not used in logic

damage = 2;
hit_stun = 8;
hit_push = 1;
freeze_duration = global.light_freeze_duration;
shake_impact = global.light_shake_impact;
h_launch = 0;
v_launch = 0;

swing_sound = Snd_Knack;