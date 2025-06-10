// Remove circle from the player
if(is_meter_circle){
	spawner.meter_circle = noone;
}
else{
	spawner.circle = noone;
}

spawn_effect(x, y, 1, Eff_Ring, 1, 0.1, c_red, 0, 0, 0.2);
instance_destroy();