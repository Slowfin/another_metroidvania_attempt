// keybinds
 scr_keybinds()

switch state {
	case states_player.normal: scr_player_normal() break
	case states_player.swim: scr_player_swim() break
	case states_player.knockback: scr_player_knockback() break
	case states_player.heal: scr_player_heal() break
	case states_player.attack_ketchup: scr_player_attack_ketchup() break
}

if global.cheats {
if keyboard_check_pressed(ord("R")) {
	game_restart()	
}
if keyboard_check_pressed(vk_backspace) and invincible <= 0{
	get_hit = true
}	
if keyboard_check_pressed(vk_enter) {
	hp += 1	
} if keyboard_check_pressed(vk_shift) {
	ketchup += 1	
}
}

if place_meeting(x,y,obj_camera_limit) {
	with obj_camera_limit if place_meeting(x,y,obj_player) {
	obj_camera.set_x = set_x
	obj_camera.set_y = set_y 
	obj_camera.sp = sp
	obj_camera.limit_x1 = limit_x1
	obj_camera.limit_x2 = limit_x2
	obj_camera.limit_y1 = limit_y1
	obj_camera.limit_y2 = limit_y2
	}
} else {
	obj_camera.set_x = 0
	obj_camera.set_y = 0
	obj_camera.sp = obj_camera.sp_set
	obj_camera.limit_x1 = 0
	obj_camera.limit_x2 = room_width
	obj_camera.limit_y1 = 0
	obj_camera.limit_y2 = room_height
}



if invincible > 0 {
	invincible -= 1
} else {
}
	
if get_hit {
	hp -= 1
	get_hit = false
	alarm[0] = 7
	invincible = invincible_set
	alarm[1] = 15
	obj_camera.alarm[0] = 5
	obj_camera.shake_power = 2
	obj_get_hit.image_alpha = 1
	layer = layer_get_id("Instances_white")
	if state != states_player.heal and state != states_player.attack_ketchup and state != states_player.knockback {
	prev_state	= state	
	} else {
	prev_state	= states_player.normal
	}
	if state == states_player.heal {
		x = _x
		y = _y	
	}
	knockback_time = 40
	state = states_player.knockback
	hsp = sign(x - source_x) * 2
	vsp = -4
	audio_play_sound(snd_get_hit,1,0,1,0,random_range(0.8,1.1))
	
}



if hp <= 0 {
	hp = 0
	image_blend = c_red	
} else {
	image_blend = c_white	
}

ketchup = clamp(ketchup,0,ketchup_max)
hp = clamp(hp,0,max_hp)

//if hp <= 0 {
//	sprite_index = spr_player_dead	
//}