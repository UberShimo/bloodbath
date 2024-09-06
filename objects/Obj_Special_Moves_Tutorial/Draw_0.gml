draw_self();

if(Obj_Dojo_Manager.student.object_index == Obj_Batman){
	draw_text_transformed(x+text_x, y+text_y, "Press quickly: Down > Forward > X\nTo throw your ball!", text_scale, text_scale, 0);
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Katana){
	draw_text_transformed(x+text_x, y+text_y, "Press quickly: Down > Backward > Y\nTo do a quick slash!", text_scale, text_scale, 0);
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Claws){
	draw_text_transformed(x+text_x, y+text_y, "Press quickly: Down > Down > X\nTo launch a ring!", text_scale, text_scale, 0);
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Baller){
	draw_text_transformed(x+text_x, y+text_y, "Press quickly: Down > Forward > Y\nTo swing upward!", text_scale, text_scale, 0);
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Bow){
	draw_text_transformed(x+text_x, y+text_y, "Press quickly: Down > Backward > X\nTo throw a boomerang!", text_scale, text_scale, 0);
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Greatsword){
	draw_text_transformed(x+text_x, y+text_y, "Press quickly: Down > Down > X\nTo spawn a pillar!", text_scale, text_scale, 0);
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Boomhand){
	draw_text_transformed(x+text_x, y+text_y, "Press quickly: Down > Backward > Y\nTo throw a slippy punch!", text_scale, text_scale, 0);
}
else if(Obj_Dojo_Manager.student.object_index == Obj_Cultist){
	draw_text_transformed(x+text_x, y+text_y, "Press quickly: Down > Backward > Y\nTo throw a star!", text_scale, text_scale, 0);
}