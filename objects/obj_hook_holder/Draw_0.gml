draw_set_font(fnt_pixel)

draw_set_color(c_black)
draw_line_width(x,y-8,pair_obj.x,pair_obj.y-8,2)


draw_set_color(c_dkgray)
draw_line_width(x,y-8,pair_obj.x,pair_obj.y-8,1)

if place_meeting(x,y,obj_player) and obj_player.ride == false {
layer_text_get_halign(fa_center)
draw_set_color(c_white)
draw_text(x-3,y-25,"S")
}

draw_self()