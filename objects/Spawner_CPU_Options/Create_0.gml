spawn_amount = global.max_players;
spawn_width = sprite_get_width(sprite_index);

for(i = 0; i < spawn_amount; i++){
	option = instance_create_depth(x+(spawn_width*i), y, depth, Obj_CPU_Option);
	option.index = i;
}