draw_self();

if(place_meeting(x, y, Obj_Menu_Picker)){
	if(global.arena == Arena_Cage){
		draw_sprite(Spr_Cage_Layout, 0, x+spr_width, y);
	}
	else if(global.arena == Arena_Hole){
		draw_sprite(Spr_Hole_Layout, 0, x+spr_width, y);
	}
	else if(global.arena == Arena_Platform){
		draw_sprite(Spr_Platform_Layout, 0, x+spr_width, y);
	}
	else{
		draw_sprite(Spr_Normal_Layout, 0, x+spr_width, y);
	}
}