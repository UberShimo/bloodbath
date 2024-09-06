event_inherited();

is_active = false;
is_final = true;
is_projectile = true;

weight = 0.02;
h_acceleration = 0.04;
max_speed = 4;

collide = function(){
	instance_destroy();
}