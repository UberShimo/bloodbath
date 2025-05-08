if(dummy != noone){
	p2_ui_hp = dummy.HP/dummy.max_HP;
	p2_ui_meter = dummy.meter/dummy.max_meter;
	p2_ui_hearts = 1;
}

event_inherited();
