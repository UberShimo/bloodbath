
if(place_meeting(x, y, Obj_Action_Info_Picker)){
	picker = instance_place(x, y, Obj_Action_Info_Picker);
	if(picker.show_info){
		show_info = true;
	}
	else{
		show_info = false;
	}
	sprite_bg_alpha = 0.15;
}
else{
	show_info = false;
	sprite_bg_alpha = 0.05;
}

if(show_info){
	depth = -1;
}
else{
	depth = 1;
}