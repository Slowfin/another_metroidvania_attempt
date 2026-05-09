if place_meeting(x,y,obj_player) and obj_player.invincible <= 0 {
	obj_player.get_hit = true	
	obj_player.source_x = x
	obj_player.source_y = y
}