list = ds_list_create();

for(i = 1; i < 11; i++){
	ds_list_add(list, [i, i+10]);
}

ds_list_delete(list, 4);
ds_list_delete(list, 4);

ds_list_insert(list, 0, [0, 0]);