if place_meeting(x,y,obj_player) {
	obj_player.pwr_ride = true	
	instance_destroy()
	audio_play_sound(snd_power_get,1,0)
}