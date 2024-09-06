event_inherited();

eff = instance_create_depth(x, y, depth, Obj_Bow_Arrow_fade_eff);
eff.image_xscale = image_xscale;
eff.image_angle = image_angle;

if(time_reset_alarm > 0){
	time_reset_alarm -= global.game_time;
	
	if(time_reset_alarm <= 0){
		time_reset_alarm = 0;
		
		object_time = 1;
	}
}