event_inherited();

text = "All characters have special moves.\n"+
"Some are performed with\n"+
"a input sequence.";
text_scale = 0.6;

bonus_text = "";
button_spr = Spr_X;
input_spr = Spr_DF;

if(Obj_Dojo_Manager.student.object_index == Obj_Dojo){
	bonus_text = "Down > Forward > Y\nTo fire projectile!";
	button_spr = Spr_Y;
	input_spr = Spr_DF;
	sprite_index = Spr_Special_DF_Y_Control;
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Batman){
	bonus_text = "Down > Forward > B\nTo Dropkick!";
	button_spr = Spr_B;
	input_spr = Spr_DF;
	sprite_index = Spr_Special_DF_B_Control;
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Katana){
	bonus_text = "Down > Forward > Y\nTo do a quick slash!";
	button_spr = Spr_Y;
	input_spr = Spr_DF;
	sprite_index = Spr_Special_DF_Y_Control;
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Claws){
	bonus_text = "Down + Forward > B\nTo go penguin mode!";
	button_spr = Spr_B;
	input_spr = Spr_Diagonal_Input;
	sprite_index = Spr_Special_Diagonal_B_Control;
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Baller){
	bonus_text = "Down > Forward > Y\nTo whip it!";
	button_spr = Spr_Y;
	input_spr = Spr_DF;
	sprite_index = Spr_Special_DF_Y_Control;
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Bow){
	bonus_text = "Down > Forward > X, Y or B\nTo throw a boomerang!";
	button_spr = Spr_Multi_Button;
	input_spr = Spr_DF;
	sprite_index = Spr_Special_DF_B_Control;
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Greatsword){
	bonus_text = "Down + Forward > X, Y or B\nTo spawn a pillar!";
	button_spr = Spr_Multi_Button;
	input_spr = Spr_Diagonal_Input;
	sprite_index = Spr_Special_Diagonal_B_Control;
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Boomhand){
	bonus_text = "Down > Forward > Y\nTo throw a slippy punch!";
	button_spr = Spr_Y;
	input_spr = Spr_DF;
	sprite_index = Spr_Special_DF_Y_Control;
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Cultist){
	bonus_text = "Down + Forward > X, Y or B\nTo throw a star!";
	button_spr = Spr_Multi_Button;
	input_spr = Spr_Diagonal_Input;
	sprite_index = Spr_Special_Diagonal_B_Control;
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Knife){
	bonus_text = "Down > Down > B\nTo lob a grenade!";
	button_spr = Spr_B;
	input_spr = Spr_DF;
	sprite_index = Spr_Special_DF_B_Control;
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Scythe){
	bonus_text = "Down > Forward > Y\nTo release a bird!";
	button_spr = Spr_Y;
	input_spr = Spr_DF;
	sprite_index = Spr_Special_DF_Y_Control;
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Rapier){
	bonus_text = "Down > Forward > X, Y or B\nTo do a lunge!";
	button_spr = Spr_Multi_Button;
	input_spr = Spr_DF;
	sprite_index = Spr_Special_DF_B_Control;
}