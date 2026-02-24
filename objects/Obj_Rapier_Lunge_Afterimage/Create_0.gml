event_inherited();

startup = generate_sprite_frames(Spr_Rapier_Magic_Lunge_Afterimage_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Rapier_Magic_Lunge_Afterimage_recovery); // 100% informational not used in logic

damage = 0;
hit_stun = 0;
hit_push = 0;
freeze_duration = 0;
h_launch = 0;
v_launch = 0;

is_active = false;
is_projectile = true;

action_alarm = generate_sprite_frames(sprite_index);
destroy_alarm = 0;