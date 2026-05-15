if can_hit and image_index >= 3 {
if place_meeting(x,y,obj_enemies) {
	with obj_enemies if place_meeting(x,y,obj_attack_ketchup) and can_get_hit {
		get_hit = true
		get_damage = other.damage
		audio_stop_sound(snd_get_hit)
		audio_play_sound(snd_get_hit,1,0,1,0,random_range(0.85,1.15))
	}	
}
can_hit = false
audio_play_sound(snd_kethup,1,0,1,0,random_range(0.85,1.15))
obj_camera.alarm[0] = 5
obj_camera.shake_power = 1
}