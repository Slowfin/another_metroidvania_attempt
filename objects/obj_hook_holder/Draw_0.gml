draw_set_halign(fa_center)
draw_set_font(fnt_pixel)

draw_set_color(c_black)
draw_line_width(x,y-8,pair_obj.x,pair_obj.y-8,2)


draw_set_color(c_dkgray)
draw_line_width(x,y-8,pair_obj.x,pair_obj.y-8,1)

if place_meeting(x,y,obj_player) and obj_player.ride == false and obj_player.pwr_ride {
layer_text_get_halign(fa_center)
draw_set_color(c_white)
draw_text(x,y-25,"D")
}

draw_self()

if global.show_hitboxes == true {
draw_set_alpha(0.5)
draw_set_colour(c_yellow)
draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false)
draw_set_alpha(1)
}