scr_keybinds()
if place_meeting(x,y,obj_player) and key_down {
	save_game()
}

image_speed = 2

image_index_extra_sp -= 1 
if image_index_extra_sp <= 0 {
	image_index_extra_sp = image_index_extra_sp_set
	image_index_extra += 1
}

if image_index_extra > image_index_extra_max {
	image_index_extra = 0	
}