depth = 999;
parallax_amount = 0;
parallax_descreaser = 0;
parallax_adjuster = 1;

// Random BG
if(global.BG_index == 0){
	global.BG_index = irandom_range(1, array_length(global.BG_list)-1);
}

BG = global.BG_list[global.BG_index];

// TRIPPY!!!
if(BG == BG_Trippy){
	show_debug_message("OJJJJ");
	bg_layer = layer_get_id("Background");
	if(layer_exists(bg_layer)){
	    layer_destroy(bg_layer);
	}
}