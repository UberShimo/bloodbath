event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Sword_Dunk_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_Sword_Dunk_recovery); // 100% informational not used in logic

damage = 17;
hit_stun = 28;
hit_push = 4;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 1;
v_launch = 12;

is_sticky = true;
is_parryable = false;

swing_sound = Snd_Smack;
hit_sound = Snd_Crack;