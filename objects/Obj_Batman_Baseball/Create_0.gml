event_inherited();

startup = generate_sprite_frames(Spr_Batman_Pitch_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_Pitch_recovery); // 100% informational not used in logic

is_projectile = true;
is_cancelable = true;
weight = 0.4;
collision_check_distance = 16;
hit_push = 0;

is_active = false;
h_spin = 0;
max_velocity = 16;
priority_struck = false;
priority_struck_alarm = 0;

hitbox_list = ds_list_create();

collide = function(){
	instance_destroy();
}