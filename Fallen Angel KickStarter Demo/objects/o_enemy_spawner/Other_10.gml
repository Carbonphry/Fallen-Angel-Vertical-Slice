/// @description Respawn All Enemies
// You can write your code in this editor
switch room {

	case r_protodung:

	with instance_create_layer(176,500,"Instances", o_enemy_portal) {
		enemy_ = o_cherub;
	}
	with instance_create_layer(174,561,"Instances", o_enemy_portal) {
		enemy_ = o_cherub;
	}
	with instance_create_layer(255,563,"Instances", o_enemy_portal) {
		enemy_ = o_cherub;
	}
	with instance_create_layer(320,528,"Instances", o_enemy_portal) {
		enemy_ = o_lancer;
	}

	with instance_create_layer(272,787,"Instances", o_enemy_portal) {
		enemy_ = o_cherub;
	}
	with instance_create_layer(255,820,"Instances", o_enemy_portal) {
		enemy_ = o_cherub;
	}
	with instance_create_layer(208,836,"Instances", o_enemy_portal) {
		enemy_ = o_cherub;
	}
	with instance_create_layer(160,788,"Instances", o_enemy_portal) {
		enemy_ = o_flameangel;
	}
	with instance_create_layer(127,866,"Instances", o_enemy_portal) {
		enemy_ = o_flameangel;
	}

	with instance_create_layer(1004,500,"Instances", o_enemy_portal) {
		enemy_ = o_tankangel;
	}


	with instance_create_layer(928,787,"Instances", o_enemy_portal) {
		enemy_ = o_cherub;
	}
	with instance_create_layer(960,787,"Instances", o_enemy_portal) {
		enemy_ = o_cherub;
	}
	with instance_create_layer(975,835,"Instances",o_enemy_portal) {
		enemy_ = o_cherub;
	}
	with instance_create_layer(895,820,"Instances", o_enemy_portal) {
		enemy_ = o_tankangel;
	}
	break;

	
	case r_room4:
		
	switch spawnR4 {
		
		case 1:
		with instance_create_layer(120,370,"Instances", o_enemy_portal) {
			enemy_ = o_cherub;
		}
		with instance_create_layer(327,402,"Instances", o_enemy_portal) {
			enemy_ = o_cherub;
		}
		with instance_create_layer(134,344,"Instances", o_enemy_portal) {
			enemy_ = o_flameangel;
		}
		with instance_create_layer(267,373,"Instances", o_enemy_portal) {
			enemy_ = o_flameangel;
		}
		spawnR4++;
		break;
		
		case 2:
		with instance_create_layer(241,370,"Instances", o_enemy_portal) {
			enemy_ = o_tankangel;
		}
		spawnR4++;
		break;
	
	}
	
	break;
	
	case r_room5:
	
		with instance_create_layer(120,370,"Instances", o_enemy_portal) {
			enemy_ = o_cherub;
		}
		with instance_create_layer(327,402,"Instances", o_enemy_portal) {
			enemy_ = o_cherub;
		}
		with instance_create_layer(134,344,"Instances", o_enemy_portal) {
			enemy_ = o_flameangel;
		}
		with instance_create_layer(267,373,"Instances", o_enemy_portal) {
			enemy_ = o_flameangel;
		}
		break;
	break;
	
	case r_room7:
	
	switch spawnR7 {
	
		case 1:
		
		with instance_create_layer(345,448,"Instances", o_enemy_portal) {
			enemy_ = o_cherub;
		}
		with instance_create_layer(334,624,"Instances", o_enemy_portal) {
			enemy_ = o_cherub;
		}
		
		with instance_create_layer(655,462,"Instances", o_enemy_portal) {
			enemy_ = o_cherub;
		}
		with instance_create_layer(616,605,"Instances", o_enemy_portal) {
			enemy_ = o_cherub;
		}
		
		
		with instance_create_layer(367,461,"Instances", o_enemy_portal) {
			enemy_ = o_flameangel;
		}
		with instance_create_layer(623,456,"Instances", o_enemy_portal) {
			enemy_ = o_flameangel;
		}
		
		with instance_create_layer(505,635,"Instances", o_enemy_portal) {
			enemy_ = o_flameangel;
		}
		spawnR7++;
		break;
		
		case 2:
		with instance_create_layer(300,436,"Instances", o_enemy_portal) {
			enemy_ = o_lancer;
		}
		with instance_create_layer(300,635,"Instances", o_enemy_portal) {
			enemy_ = o_tankangel;
		}
		with instance_create_layer(708,436,"Instances", o_enemy_portal) {
			enemy_ = o_tankangel;
		}
		with instance_create_layer(708,635,"Instances", o_enemy_portal) {
			enemy_ = o_lancer;
		}
		
		spawnR7++;
		break;
		
		case 4:
		
		break;
		
	}
	break;


}