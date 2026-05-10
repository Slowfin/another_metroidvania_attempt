draw_self()

if place_meeting(x,y,obj_player) {
draw_set_color(c_white)
draw_sprite(spr_arrow_down,image_index_extra,x,y-8)
}

if global.show_hitboxes == true {
draw_set_alpha(0.5)
draw_set_colour(c_yellow)
draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false)
draw_set_alpha(1)
}