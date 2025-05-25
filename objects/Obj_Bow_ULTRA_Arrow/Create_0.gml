event_inherited();

startup = generate_sprite_frames(Spr_Bow_ULTRA_startup);
recovery = generate_sprite_frames(Spr_Bow_ULTRA_recovery);

is_projectile = true;
is_active = false;
is_final = true;

max_speed = 24;
max_duration = 480;
acceleration = 4;
break_power = 1;
v_speed = 2;
target = noone;
turns = 0;
existing_hitbox = noone;

collide = function(){
	move_step();
}