if(other.index != index){
	if(target == noone){
		target = other;
	}
	
	// Destroy on 6th hit
	if(turns >= 6){
		instance_destroy(existing_hitbox);
		instance_destroy();
	}
}

