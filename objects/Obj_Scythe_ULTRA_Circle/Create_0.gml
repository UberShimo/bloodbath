event_inherited();

startup = generate_sprite_frames(Spr_Scythe_ULTRA_startup);
recovery = generate_sprite_frames(Spr_Scythe_ULTRA_recovery);

damage = 0;
hit_stun = 0;
hit_push = 0;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = 0;

is_active = false;
is_projectile = true;
projectile_duration = 240;
velocity_friction = 0.05;

swing_sound = Snd_NOTHING;

// ULTRA Circle stuff
slow_down = 0;
lift_amount = 0.5;
depth = -5;
spawn_hitbox_frequence = 8;
spawn_hitbox_alarm = spawn_hitbox_frequence;

collide = function(){
	move_step();
}