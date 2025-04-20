event_inherited();

startup = generate_sprite_frames(Spr_Claws_5S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Claws_5S_recovery); // 100% informational not used in logic

damage = 3;
hit_stun = 20;
hit_push = 0;
freeze_duration = 6;
shake_impact = global.medium_shake_impact;
h_launch = 0;
v_launch = 1;

is_sticky = true;
is_cancelable = true;

swing_sound = Snd_Quick_Swing;