if safe > 0 {
	safe -= 1
}	

if obj_play.state == "save" {
	y = _y
	if safe <= 0 {

if position_meeting(mouse_x,mouse_y,self) {
	hover = true	
} else {
	hover = false	
}

if hover and mouse_check_button(mb_left) {
	image_index = 2	
} else if hover {
	image_index = 1	
} else {
	image_index = 0	
} 

if hover and mouse_check_button_released(mb_left) {
	global.transition_alpha = 1
	global.save_slot_play = save_slot
	with instance_create_layer(x,y,"Instances",obj_game) {
		if file_exists("savegame" + string(global.save_slot_play) + ".sav") {
			save_load()
		} else if !file_exists("savegame" + string(global.save_slot_play) + ".sav") {
			room_goto(rm_dirt_start)
			 with instance_create_layer(98,-16,"Player",obj_player) {
				pwr_wall_jump = false
				pwr_dash = false
				pwr_double_jump = false
				pwr_ride = false
				pwr_swim =  false
				pwr_ketchup_attack = false
				max_hp = 5
				hp = max_hp
				damage = 7
				ketchup = 0	 
			 }
		}
	}
}

} } else {
	y = -500
}	