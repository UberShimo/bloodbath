event_inherited();

startup = generate_sprite_frames(Spr_Batman_Pitch_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_Pitch_recovery); // 100% informational not used in logic

is_projectile = true;
is_cancelable = true;
weight = 0.4;
collision_check_distance = 12;
hit_push = 1;
h_launch = 1;
v_launch = -1;

is_active = false;

// Baseball stuff
h_spin = 0;
max_velocity = 16;
priority_struck = false;
priority_struck_alarm = 0;
collision_protection = 10; // 10 frames of cant hit opponent
juggles = 0; // Achievement related

hitbox_list = ds_list_create();

collide = function(){
	instance_destroy();
}