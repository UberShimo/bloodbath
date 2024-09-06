for(i = 0; i < ds_list_size(list)-1; i++){
	a = ds_list_find_value(list, i);
	draw_text(x, y+i*16, string(a[0]));
	draw_text(x+32, y+i*16, string(a[1]));
}