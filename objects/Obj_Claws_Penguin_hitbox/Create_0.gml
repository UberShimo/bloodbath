event_inherited();

startup = generate_sprite_frames(Spr_Claws_Penguin_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Claws_Penguin_recovery); // 100% informational not used in logic

damage = 6;
hit_stun = global.medium_hitstun;
hit_push = 5;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 2;
v_launch = -3;

is_sticky = true;
active_frames = 24;

swing_sound = Snd_NOTHING;