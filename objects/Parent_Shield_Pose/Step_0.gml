event_inherited();

image_angle -= rotation*image_xscale*projectile_duration/start_duration;

image_alpha = max_image_alpha*projectile_duration/start_duration;

if(is_targetable_alarm > 0){
	is_targetable_alarm -= logic_time;
	
	if(is_targetable_alarm <= 0){
		is_targetable = true;
	}
}