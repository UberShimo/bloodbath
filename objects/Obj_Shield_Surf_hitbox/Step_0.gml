event_inherited();

if(spawner.get_velocity() > 7 && spawner.recover_alarm < spawner.surf_max_duration-8){
	is_active = true;
	damage = spawner.get_velocity();
}
else{
	is_active = false;
}