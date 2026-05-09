//draw_sprite_ext(spr_health_bar,image_index,130,50,4,4,0,c_white,1)

//if obj_player.hp >= 1 {
//	draw_sprite_ext(spr_health,image_index,150,60,4,4,0,c_white,1)
//}
//if obj_player.hp >= 2 {
//	draw_sprite_ext(spr_health,0,150+(35),55,4,4,0,c_white,1)
//}
//if obj_player.hp >= 3 {
//	draw_sprite_ext(spr_health,image_index,150+(35*2),50,4,4,0,c_white,1)
//}
//if obj_player.hp >= 4 {
//	draw_sprite_ext(spr_health,image_index,150+(35*3),50,4,4,0,c_white,1)
//}
//if obj_player.hp >= 5 {
//	draw_sprite_ext(spr_health,image_index,150+(35*4),50,4,4,0,c_white,1)
//}
//if obj_player.hp >= 6 {
//	draw_sprite_ext(spr_health,image_index,150+(35*5),50,4,4,0,c_white,1)
//} 
//if obj_player.hp >= 7 {
//	draw_sprite_ext(spr_health,image_index,150+(35*6),50,4,4,0,c_white,1)
//} 
//if obj_player.hp >= 8 {
//	draw_sprite_ext(spr_health,image_index,150+(35*7),50,4,4,0,c_white,1)
//} 
//if obj_player.hp >= 9 {
//	draw_sprite_ext(spr_health,image_index,150+(35*8),50,4,4,0,c_white,1)
//} 
//if obj_player.hp >= 10 {
//	draw_sprite_ext(spr_health,image_index,150+(35*9),50,4,4,0,c_white,1)
//} 
//if obj_player.hp >= 11 {
//	draw_set_colour(c_white)
//	draw_text_transformed(150+(34*10),35,"+" + string((obj_player.hp)-10),2,2,0)
//}	


//if obj_player.hp >= 1 {
//	draw_sprite_ext(spr_health_2,image_index,50,60,4,4,0,c_white,1)
//}
//if obj_player.hp >= 2 {
//	draw_sprite_ext(spr_health_2,image_index,75,88,4,4,0,c_white,1)
//}
//if obj_player.hp >= 3 {
//	draw_sprite_ext(spr_health_2,image_index,90,42,4,4,0,c_white,1)
//}
//if obj_player.hp >= 4 {
//	draw_sprite_ext(spr_health_2,image_index,35,94,4,4,0,c_white,1)
//}
//if obj_player.hp >= 5 {
//	draw_sprite_ext(spr_health_2,image_index,45,25,4,4,0,c_white,1)
//}
//if obj_player.hp >= 6 {
//	draw_sprite_ext(spr_health_2,image_index,78,15,4,4,0,c_white,1)
//}
//if obj_player.hp >= 7 {
//	draw_sprite_ext(spr_health_2,image_index,115,72,4,4,0,c_white,1)
//}


if obj_player.hp < 1 {
draw_sprite_ext(spr_health_bar_1,0,130,50,4,4,0,c_white,1)
}
else  if obj_player.hp < 11 and obj_player > 0 {
draw_sprite_ext(spr_health_bar_1,obj_player.hp,130,50,4,4,0,c_white,1)
}
else {
draw_sprite_ext(spr_health_bar_1,10,130,50,4,4,0,c_white,1)	
}

if obj_player.hp >= 11 {
	draw_set_colour(c_white)
	draw_text_transformed(150,35,"+" + string((obj_player.hp)-10),2,2,0)
}	

if obj_player.ketchup <= 0 {
	draw_sprite_ext(spr_ketchup_bar,0,65,220,4,4,0,c_white,1)
} if obj_player.ketchup >= 1 {
	draw_sprite_ext(spr_ketchup_bar,1,65,220,4,4,0,c_white,1)
} if obj_player.ketchup >= 2 {
	draw_sprite_ext(spr_ketchup_bar,2,65,220,4,4,0,c_white,1)
} if obj_player.ketchup >= 3 {
	draw_sprite_ext(spr_ketchup_bar,3,65,220,4,4,0,c_white,1)
} if obj_player.ketchup >= 4 {
	draw_sprite_ext(spr_ketchup_bar,4,65,220,4,4,0,c_white,1)
} if obj_player.ketchup >= 5 {
	draw_sprite_ext(spr_ketchup_bar,5,65,220,4,4,0,c_white,1)
}

draw_set_colour(c_white)
if debug {
	draw_text(10,10,obj_player.hsp)
	draw_text(10,10+(15*1),obj_player.vsp)
	draw_text(10,10+(15*2),obj_player.sp)
	draw_text(10,10+(15*3),obj_player.grounded)
	draw_text(10,10+(15*4),obj_player.attack_cd)
	draw_text(10,10+(15*5),obj_player.dash_cd)
	draw_text(10,10+(15*6),obj_player.hp)
	draw_text(10,10+(15*7),obj_player.ketchup)
	draw_text(10,10+(15*8),room_get_name(room))
}

if global.transition_alpha > 0 {
	draw_set_colour(c_black)
	draw_set_alpha(global.transition_alpha)
	draw_rectangle(0,0,1280,720,0)	
	draw_set_alpha(1)
}
