if !global.walls_broken[$ id_name]  {
audio_stop_sound(broken_snd)
audio_play_sound(broken_snd,1,0)
for (var i = 0; i < coin_drop; i++) {
	instance_create_layer(x,y,"Instances",obj_coin)	
	}
}

global.walls_broken[$ id_name] = true