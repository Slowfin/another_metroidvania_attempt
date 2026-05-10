scr_keybinds()

if key_heal and trigger == 1 {
	if place_meeting(x,y,obj_heal_bar_stick) {
			obj_player.hp += 2
			audio_play_sound(snd_heal_succes,1,0,1,0,choose(0.9,1.1))
			success = 1
		} else {
			audio_play_sound(snd_heal_fail,1,0,1,0,choose(0.9,1.1))	
			success = 2
		}
	trigger = 0
	instance_destroy()
	with stick  {
	instance_destroy()	
	}
	obj_player.state = obj_player.prev_state
}


if trigger == 1 {
	if stick.x > x + 10 {
	success = 2
	trigger = 0 
	instance_destroy()
	with stick  {
	instance_destroy()	
	}
	obj_player.state = obj_player.prev_state
	audio_play_sound(snd_heal_fail,1,0,1,0,choose(0.9,1.1))
	}
}

if obj_player.state != states_player.heal and trigger == 1 {
		audio_play_sound(snd_heal_fail,1,0,1,0,choose(0.9,1.1))
	trigger = 0 
	success = 2
	instance_destroy()
	with stick  {
	instance_destroy()	
	}
}