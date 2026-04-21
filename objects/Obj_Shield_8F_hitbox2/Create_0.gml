event_inherited();

startup = generate_sprite_frames(Spr_Shield_8F_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Shield_8F_whiff); // 100% informational not used in logic

damage = 0;
hit_stun = global.heavy_hitstun;
hit_push = 0;
freeze_duration = global.light_freeze_duration;
shake_impact = global.light_shake_impact;
h_launch = 1.5;
v_launch = 10;

is_sticky = true;

swing_sound = Snd_NOTHING;
