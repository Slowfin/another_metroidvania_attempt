if trigger == 0 {
	if success == 1 {
		instance_create_layer(x,y,"Game",obj_heal_status).sprite_index = spr_heal_succes
	}
	if success == 2 {
		instance_create_layer(x,y,"Game",obj_heal_status).sprite_index = spr_heal_fail
		obj_camera.shake_power = 1
		obj_camera.alarm[0] = 5
	}
}
obj_player.vsp = -1
audio_stop_sound(snd_heal_start)