// Really wierd and ugly way of checking if players are ready but...
if(Obj_Character_Picker.check_if_all_players_ready()){
	draw_self();
}
// Player are not ready...
else{
	draw_x = -room_width+scroll_effect_amount;
	draw_set_alpha(0.1);
	while(draw_x < room_width){
		draw_sprite(Spr_Pick_Your_Character, 0, draw_x, scroll_effect_y);
		draw_x += scroll_effect_distance;
	}
	scroll_effect_amount += scroll_effect_speed;
	if(scroll_effect_amount > scroll_effect_distance){
		scroll_effect_amount = 0;
	}
	draw_set_alpha(1);
}