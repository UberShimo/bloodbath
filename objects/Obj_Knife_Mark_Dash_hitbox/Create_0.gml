event_inherited();

startup = generate_sprite_frames(Spr_Knife_Mark_Dash_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Knife_Mark_Dash_recovery); // 100% informational not used in logic

damage = 0;
hit_stun = 0;
hit_push = 0;
freeze_duration = 0;
shake_impact = 0;
h_launch = 0;
v_launch = 0;

is_sticky = true;
is_cancelable = true;
is_parryable = false;

swing_sound = Snd_NOTHING;
hit_sound = Snd_NOTHING;