/// @description Respawn All Enemies
// You can write your code in this editor
switch room {

	case r_protodung:

	with instance_create_layer(176,500,"Solids", o_enemy_portal) {
		enemy_ = o_cherub;
	}
	with instance_create_layer(174,561,"Solids", o_enemy_portal) {
		enemy_ = o_cherub;
	}
	with instance_create_layer(255,563,"Solids", o_enemy_portal) {
		enemy_ = o_cherub;
	}
	with instance_create_layer(320,528,"Solids", o_enemy_portal) {
		enemy_ = o_lancer;
	}

	with instance_create_layer(272,787,"Solids", o_enemy_portal) {
		enemy_ = o_cherub;
	}
	with instance_create_layer(255,820,"Solids", o_enemy_portal) {
		enemy_ = o_cherub;
	}
	with instance_create_layer(208,836,"Solids", o_enemy_portal) {
		enemy_ = o_cherub;
	}
	with instance_create_layer(160,788,"Solids", o_enemy_portal) {
		enemy_ = o_flameangel;
	}
	with instance_create_layer(127,866,"Solids", o_enemy_portal) {
		enemy_ = o_flameangel;
	}

	with instance_create_layer(1004,500,"Solids", o_enemy_portal) {
		enemy_ = o_tankangel;
	}


	with instance_create_layer(928,787,"Solids", o_enemy_portal) {
		enemy_ = o_cherub;
	}
	with instance_create_layer(960,787,"Solids", o_enemy_portal) {
		enemy_ = o_cherub;
	}
	with instance_create_layer(975,835,"Solids",o_enemy_portal) {
		enemy_ = o_cherub;
	}
	with instance_create_layer(895,820,"Solids", o_enemy_portal) {
		enemy_ = o_tankangel;
	}
	break;

	
	case r_intro_room4:
		
	switch spawnR4 {
		
		case 1:
		with instance_create_layer(120,370,"Solids", o_enemy_portal) {
			enemy_ = o_cherub;
		}
		with instance_create_layer(134,344,"Solids", o_enemy_portal) {
			enemy_ = o_flameangel;
		}
		with instance_create_layer(267,373,"Solids", o_enemy_portal) {
			enemy_ = o_flameangel;
		}
		spawnR4++;
		break;
		
		case 2:
		with instance_create_layer(241,370,"Solids", o_enemy_portal) {
			enemy_ = o_tankangel;
		}
		spawnR4++;
		break;
	
	}
	
	break;
	
	case r_intro_room5:
	
		with instance_create_layer(120,370,"Solids", o_enemy_portal) {
			enemy_ = o_cherub;
		}
		with instance_create_layer(327,402,"Solids", o_enemy_portal) {
			enemy_ = o_cherub;
		}
		with instance_create_layer(134,344,"Solids", o_enemy_portal) {
			enemy_ = o_flameangel;
		}
		with instance_create_layer(267,373,"Solids", o_enemy_portal) {
			enemy_ = o_flameangel;
		}
		break;
	break;
	
	case r_intro_room7:
	
	switch spawnR7 {
	
		case 1:
		
		with instance_create_layer(345,448,"Solids", o_enemy_portal) {
			enemy_ = o_cherub;
		}
		with instance_create_layer(334,624,"Solids", o_enemy_portal) {
			enemy_ = o_cherub;
		}
		
		with instance_create_layer(655,462,"Solids", o_enemy_portal) {
			enemy_ = o_cherub;
		}
		with instance_create_layer(616,605,"Solids", o_enemy_portal) {
			enemy_ = o_cherub;
		}
		
		
		with instance_create_layer(367,461,"Solids", o_enemy_portal) {
			enemy_ = o_flameangel;
		}
		with instance_create_layer(623,456,"Solids", o_enemy_portal) {
			enemy_ = o_flameangel;
		}
		
		with instance_create_layer(505,635,"Solids", o_enemy_portal) {
			enemy_ = o_flameangel;
		}
		spawnR7++;
		break;
		
		case 2:
		with instance_create_layer(300,436,"Solids", o_enemy_portal) {
			enemy_ = o_lancer;
		}
		with instance_create_layer(300,635,"Solids", o_enemy_portal) {
			enemy_ = o_tankangel;
		}
		with instance_create_layer(708,436,"Solids", o_enemy_portal) {
			enemy_ = o_tankangel;
		}
		with instance_create_layer(708,635,"Solids", o_enemy_portal) {
			enemy_ = o_lancer;
		}
		
		spawnR7++;
		break;
		
		case 4:
		
		break;
		
	}
	break;
	
	
	case r_gabriel_ancientcity_room1:
	switch spawnRG {
		
		case 1:
		with instance_create_layer(1725,235,"Solids", o_enemy_portal) {
			enemy_ = o_caveman;
		}
		with instance_create_layer(1870,315,"Solids", o_enemy_portal) {
			enemy_ = o_caveman;
		}
		
		with instance_create_layer(1870,235,"Solids", o_enemy_portal) {
			enemy_ = o_caveman;
		}
		
		with instance_create_layer(1725,315,"Solids", o_enemy_portal) {
			enemy_ = o_caveman;
		}
		spawnRG++;
		break;
		
		case 2:
		with instance_create_layer(1830,280,"Solids", o_enemy_portal) {
			enemy_ = o_NEW_boss;
		}
		spawnRG++;
		break;
	
	}
	break;


}