if(other.index != index){
	if(target == noone){
		target = other;
	}
	
	// Destroy on fifth hit
	if(turns >= 5){
		instance_destroy(existing_hitbox);
		instance_destroy();
	}
}

