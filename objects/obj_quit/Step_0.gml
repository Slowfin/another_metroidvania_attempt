if obj_play.state == "menu" {

if position_meeting(mouse_x,mouse_y,self) {
	hover = true	
} else {
	hover = false	
}

if hover and mouse_check_button(mb_left) {
	image_index = 2	
	scale = 0.9
} else if hover {
	image_index = 1	
	scale = 1
} else {
	image_index = 0
	scale = 1
} 

if hover and mouse_check_button_released(mb_left) {
	game_end()
}

}

if obj_play.state == "save" {
scale = 1

	
}