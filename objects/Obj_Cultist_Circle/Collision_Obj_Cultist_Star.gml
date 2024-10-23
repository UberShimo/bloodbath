sprite_index = Spr_Cultist_Circle_Implosion_startup;
image_index = 0;
implode_alarm = generate_sprite_frames(sprite_index);
spawner.circle = noone;

audio_play_sound(Snd_Light_Swing, 0, false);

instance_destroy(other);