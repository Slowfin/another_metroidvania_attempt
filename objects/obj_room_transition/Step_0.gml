if place_meeting(x,y,obj_player) {
	if instance_exists(obj_polovnik) {
		with obj_polovnik {
			instance_destroy()
		}	
	}
	room_goto(trans_room)
	obj_player.x = trans_x
	obj_player.y = trans_y
	obj_player.attack = false
}