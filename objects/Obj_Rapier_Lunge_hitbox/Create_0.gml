event_inherited();

startup = "4-20"; // Kinda wierd...
recovery = generate_sprite_frames(Spr_Rapier_Lunge_recovery); // 100% informational not used in logic

damage = 10;
hit_stun = global.medium_hitstun;
hit_push = 2;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 2;
v_launch = -2;

is_sticky = true;
hit_sound = Snd_Hit2;