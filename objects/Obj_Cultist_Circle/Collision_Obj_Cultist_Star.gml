sprite_index = Spr_Cultist_Circle_Implosion_startup;
image_index = 0;
implode_alarm = 1;
// Remove circle from the player
if(is_meter_circle){
	spawner.meter_circle = noone;
}
else{
	spawner.circle = noone;
}

audio_play_sound(Snd_Light_Swing, 0, false);

instance_destroy(other);