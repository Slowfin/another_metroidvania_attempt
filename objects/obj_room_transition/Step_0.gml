if place_meeting(x,y,obj_player) and global.transition = false {
	global.transition = true
	obj_game.trans_room = trans_room
	obj_game.trans_x = trans_x
	obj_game.trans_y = trans_y
	if vertical == true {
		obj_game.assend = 5
	} else {
		obj_game.assend = 0
	}
}


