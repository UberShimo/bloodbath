event_inherited();

image = global.wall_images[Obj_BG.index];

check_where_to_draw_outline();

draw_below_room = false;
if(y+height > room_height){
	draw_below_room = true;
}
