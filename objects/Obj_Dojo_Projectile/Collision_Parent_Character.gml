event_inherited();

if(other.index != index){
	spawn_effect(x+8*image_xscale, y, 1, Eff_Ring, 1, 0.1, c_red, 0.2, 0.2, 0.2);
	instance_destroy();
}