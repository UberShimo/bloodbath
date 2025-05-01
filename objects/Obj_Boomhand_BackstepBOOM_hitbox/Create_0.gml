event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_BackstepBOOM_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Boomhand_BackstepBOOM_recovery); // 100% informational not used in logic

damage = 16;
hit_stun = 20;
hit_push = 10;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 8;
v_launch = -2;

is_sticky = true;
active_frames = 16;

swing_sound = Snd_Light_Swing;
hit_sound = Snd_Hit2;