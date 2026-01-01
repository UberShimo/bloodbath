/// @description Initiate stuff
	
if(global.dojo_level == 1){
	instance_create_depth(Obj_Blackboard.x+controller_x, Obj_Blackboard.y+controller_y, 10, Obj_Move_Tutorial);
	dummy = instance_create_depth(Obj_Blackboard.x+128, Obj_Blackboard.y, depth, Obj_Immortal_Dummy);
	global.is_debugging = false;
}
else if(global.dojo_level == 2){
	instance_create_depth(Obj_Blackboard.x+controller_x, Obj_Blackboard.y+controller_y, 10, Obj_Special_Moves_Tutorial);
	dummy = instance_create_depth(Obj_Blackboard.x+128, Obj_Blackboard.y, depth, Obj_Immortal_Dummy);
	global.is_debugging = false;
}
else{
	instance_create_depth(Obj_Blackboard.x+controller_x, Obj_Blackboard.y+controller_y, 10, Obj_Freeform_Tutorial);
	dummy = instance_create_depth(Spawner_P2.x, Spawner_P2.y, depth, Obj_Immortal_Dummy);
	dummy.is_controllable = true; // Sprite wont work etc if uncontrollable...
}

// Set wall images to Training room
Parent_Collision.image = Spr_Trainingroom_Walls;
Obj_Platform.image = Spr_Trainingroom_Walls;
Obj_BG.BG = BG_Trainingroom;