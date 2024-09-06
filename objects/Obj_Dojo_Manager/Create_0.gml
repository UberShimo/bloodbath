event_inherited();

index = -1;
student = noone;
time_switch_pressed = false;

play_music(Mu_Tutorial, global.music_volume);

// Methods
// No winning in Dojo!
check_for_winner = function(){
	// Dummy guy has index -1 so gotta do some wierd looping here
	for(i = 0; i < instance_number(Parent_Character); i++){
		obj = instance_find(Parent_Character, i);
		obj.hearts = 2;
	}
}

if(global.dojo_level == 1){
	instance_create_depth(Obj_Blackboard_Position.x, Obj_Blackboard_Position.y, 10, Obj_Move_Tutorial);
	instance_create_depth(Obj_Blackboard_Position.x+128, Obj_Blackboard_Position.y, depth, Obj_Dojo);
	global.is_debugging = false;
}
else if(global.dojo_level == 2){
	instance_create_depth(Obj_Blackboard_Position.x, Obj_Blackboard_Position.y, 10, Obj_Special_Moves_Tutorial);
	instance_create_depth(Obj_Blackboard_Position.x+128, Obj_Blackboard_Position.y, depth, Obj_Dojo);
	global.is_debugging = false;
}
else{
	instance_create_depth(Obj_Blackboard_Position.x, Obj_Blackboard_Position.y, depth, Obj_Immortal_Dummy);
	global.is_debugging = true;
}