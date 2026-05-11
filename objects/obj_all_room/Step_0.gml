if position_meeting(mouse_x,mouse_y,obj_mouse_button) {
cursor_sprite = spr_cursor_hover
} else {
cursor_sprite = spr_cursor	
}
window_set_caption("жоперный омега чпоньк")
if keyboard_check_pressed(vk_f11) {
		fullscreen = !fullscreen
		window_set_fullscreen(fullscreen)
} 
if keyboard_check_pressed(vk_f2) {
		global.show_hitboxes = !global.show_hitboxes
} 
if keyboard_check_pressed(vk_f1) {
		global.debug = !global.debug
} 

for (var i = 0; i < array_length(rooms_dirt);i++) {
	if room == rooms_dirt[i] {
		global.room_type = "dirt"	
	} 
}



if global.room_type == "dirt" {
	if !audio_is_playing(mus_dirt) {
		audio_play_sound(mus_dirt,1,1,1,0)	
	}
} else {
	audio_stop_sound(mus_dirt)	
}
 
 if old_room != room {
	zone_switch = 0 
 }
 
zone_switch += 1
zone_switch = clamp(zone_switch,0,5)