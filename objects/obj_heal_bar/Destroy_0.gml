if trigger == 0 {
	if success == 1 {
		instance_create_layer(x,y,"Game",obj_heal_status).sprite_index = spr_heal_succes
	}
	if success == 2 {
		instance_create_layer(x,y,"Game",obj_heal_status).sprite_index = spr_heal_fail
	}
}