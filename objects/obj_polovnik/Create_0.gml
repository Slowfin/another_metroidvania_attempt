randomize()
x_offset = 0
y_offset = 0
turn_y = sign(obj_player.move_v)
if turn_y > 0 {
	y_offset = 8
	x_offset = 0
	turn = 1
} else if turn_y < 0 {	
	y_offset = 8
	x_offset = 0
	turn = 1
} else {
	y_offset = 0
	x_offset = 8
	turn = obj_player.sprite_turn
}

image_angle = 90 * -turn_y
x = obj_player.x+(x_offset*turn)
y = obj_player.y+(y_offset*turn_y)
image_xscale = 1 * turn
image_yscale = choose(-1,1)
obj_player.attack = true

damage = obj_player.damage

if place_meeting(x,y,obj_enemies) {
	with obj_enemies if place_meeting(x,y,obj_polovnik) and can_get_hit {
		get_hit = true
		get_damage = other.damage
	}	
	if turn_y > 0 {
			obj_player.vsp = -obj_player.jump_power	
		}
	obj_player.ketchup += 1
	audio_stop_sound(snd_slash)
	audio_play_sound(snd_slash,1,0,1,0,random_range(0.85,1.15))
	obj_camera.alarm[0] = 5
	obj_camera.shake_power = 1
}

if place_meeting(x,y,obj_wall) {
	with obj_wall if place_meeting(x,y,obj_polovnik) and breakable {
		hp -= 1
		audio_stop_sound(snd_wall_break)
		audio_play_sound(snd_wall_break,1,0,1,0,random_range(0.85,1.15))
		obj_camera.alarm[0] = 5
		obj_camera.shake_power = 1
	}	

}

