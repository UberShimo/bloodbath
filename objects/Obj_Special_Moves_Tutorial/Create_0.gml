event_inherited();

text = "All characters have special moves.\n"+
"They are performed with\n"+
"a quick input sequence.";
text_scale = 0.6;

bonus_text = "";

if(Obj_Dojo_Manager.student.object_index == Obj_Batman){
	bonus_text = "Down > Forward > B\nTo Dropkick!";
	sprite_index = Spr_Special_DF_B_Control;
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Katana){
	bonus_text = "Down > Forward > Y\nTo do a quick slash!";
	sprite_index = Spr_Special_DF_Y_Control;
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Claws){
	bonus_text = "Down > Down > B\nTo do fancy slashes!";
	sprite_index = Spr_Special_DD_B_Control;
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Baller){
	bonus_text = "Down > Forward > Y\nTo swing upward!";
	sprite_index = Spr_Special_DF_Y_Control;
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Bow){
	bonus_text = "Down > Forward > X\nTo throw a boomerang!";
	sprite_index = Spr_Special_DF_X_Control;
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Greatsword){
	bonus_text = "Down > Down > Y\nTo spawn a pillar!";
	sprite_index = Spr_Special_DD_Y_Control;
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Boomhand){
	bonus_text = "Down > Forward > Y\nTo throw a slippy punch!";
	sprite_index = Spr_Special_DF_Y_Control;
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Cultist){
	bonus_text = "Down > Forward > Y\nTo throw a star!";
	sprite_index = Spr_Special_DF_Y_Control;
}