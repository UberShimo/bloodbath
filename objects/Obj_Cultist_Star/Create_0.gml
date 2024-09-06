event_inherited();

index = -1;
spawner = noone;
duration = 600; // 10 sec

h_velocity = 0;
h_acc = 0;
v_velocity = 0;
v_acc = 0;

// Special initiate function
initiate = function(initiator){
	index = initiator.index;
	spawner = initiator;
	image_xscale = initiator.image_xscale;
	
	initiator.cancels = 0;
	// Cancel eff
	eff = instance_create_depth(x, y, 1, Eff_Cancel);
	eff.initiate(initiator);
}

shadow_initiate = function(shadow){
	index = shadow.spawner.index;
	spawner = shadow.spawner;
}