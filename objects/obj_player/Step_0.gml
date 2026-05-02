// keybinds
key_right = keyboard_check(vk_right)
key_left = keyboard_check(vk_left)
key_down = keyboard_check(vk_down)
key_up = keyboard_check(vk_up)
key_jump = keyboard_check_pressed(ord("Z"))
key_jump_long = keyboard_check(ord("Z"))
key_jump_release = keyboard_check_released(ord("Z"))
key_dash = keyboard_check_pressed(ord("C"))
key_ride = keyboard_check_pressed(ord("S"))
key_pogo = keyboard_check_pressed(ord("X"))

switch state {
	case states_player.normal: scr_player_normal() break
	case states_player.swim: scr_player_swim() break
}

if place_meeting(x,y,obj_camera_limit) {
	with obj_camera_limit if place_meeting(x,y,obj_player) {
	obj_camera.set_x = set_x
	obj_camera.set_y = set_y 
	obj_camera.sp = sp
	limit_x1 = limit_x1
	limit_x2 = limit_x2
	limit_y1 = limit_y1
	limit_y2 = limit_y2
	}
} else {
	obj_camera.set_x = 0
	obj_camera.set_y = 0
	obj_camera.sp = obj_camera.sp_set
	limit_x1 = 0
	limit_x2 = room_width
	limit_y1 = 0
	limit_y2 = room_height
}