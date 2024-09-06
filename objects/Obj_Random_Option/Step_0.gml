event_inherited();

// RANDOMIZE ALL THE TIME BABY
rng = irandom_range(1, 8);
	
switch(rng){
	case 1:
		character = Obj_Batman;
		break;
	case 2:
		character = Obj_Katana;
		break;
	case 3:
		character = Obj_Claws;
		break;
	case 4:
		character = Obj_Baller;
		break;
	case 5:
		character = Obj_Bow;
		break;
	case 6:
		character = Obj_Greatsword;
		break;
	case 7:
		character = Obj_Boomhand;
		break;
	case 8:
		character = Obj_Cultist;
		break;
	default:
		character = Obj_Batman;
		break;
}	