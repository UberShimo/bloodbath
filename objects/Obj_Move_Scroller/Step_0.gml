if(object_exists(Obj_Action_Info_Picker)){
	if(Obj_Action_Info_Picker.y < y-move_speed){
		y -= move_speed;
	}
	else if(Obj_Action_Info_Picker.y > y+move_speed){
		y += move_speed;
	}
}