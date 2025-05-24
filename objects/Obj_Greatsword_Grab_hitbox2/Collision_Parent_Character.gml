event_inherited();

if(other.index != index){
	if(other.meter > 25){
		other.meter -= 25;
	}
	else{
		other.meter = 0;
	}
	instance_destroy();
}