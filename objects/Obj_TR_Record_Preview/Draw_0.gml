draw_text_transformed(x, y, "BEST TIME", 2, 2, 0);

val = 0;
if(P1_Preview.sprite_index == Spr_Dojo_Portrait){
	val = global.dojo_TR_record;
}
else if(P1_Preview.sprite_index == Spr_Katana_Portrait){
	val = global.katana_TR_record;
}
else if(P1_Preview.sprite_index == Spr_Batman_Portrait){
	val = global.batman_TR_record;
}
else if(P1_Preview.sprite_index == Spr_Claws_Portrait){
	val = global.claws_TR_record;
}
else if(P1_Preview.sprite_index == Spr_Baller_Portrait){
	val = global.baller_TR_record;
}
else if(P1_Preview.sprite_index == Spr_Greatsword_Portrait){
	val = global.greatsword_TR_record;
}
else if(P1_Preview.sprite_index == Spr_Boomhand_Portrait){
	val = global.boomhand_TR_record;
}
else if(P1_Preview.sprite_index == Spr_Bow_Portrait){
	val = global.bow_TR_record;
}
else if(P1_Preview.sprite_index == Spr_Cultist_Portrait){
	val = global.cultist_TR_record;
}
else if(P1_Preview.sprite_index == Spr_Knife_Portrait){
	val = global.knife_TR_record;
}
else if(P1_Preview.sprite_index == Spr_Scythe_Portrait){
	val = global.scythe_TR_record;
}
if(val <= 0){
	part_sec = "?";
	sec = "?";
}
else{
	part_sec = string(floor((val%global.FPS)/global.FPS*100));
	sec = string(floor(val/global.FPS));
}

draw_text_transformed(x, y+32, sec + "." + part_sec + " sec", 2, 2, 0);