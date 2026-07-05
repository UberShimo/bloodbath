event_inherited();

is_active = false;
is_projectile = true;
collision_check_with_distance = false;
projectile_duration = generate_sprite_frames(sprite_index);

// Ice spawner stuff
drag_along_amount = 0.25; // % based
ice_spawn_interval = 2;
ice_spawn_alarm = ice_spawn_interval;

collide = function(){
	h_velocity = 0;
}