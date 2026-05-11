if autotile {
if wall == "pink" {
	sprite_index = spr_wall_forest	
}
if wall == "dirt" {
	sprite_index = spr_wall_dirt	
}
if wall == "farm" {
	sprite_index = spr_wall_farm	
}

if hp <= 0 {
	instance_destroy()
}

// straight
if place_meeting(x+length,y,obj_wall){
	collide_r = true
} else {
	collide_r = false
}
if place_meeting(x-length,y,obj_wall){
	collide_l = true
} else {
	collide_l = false
}
if place_meeting(x,y+length,obj_wall){
	collide_d = true
} else {
	collide_d = false
}
if place_meeting(x,y-length,obj_wall){
	collide_u = true
} else {
	collide_u = false
}

// diagonals
if collision_point(x+length_diag,y+length_diag,obj_wall,false,true){
	collide_rd = true
} else {
	collide_rd = false
}
if collision_point(x-length_diag,y-length_diag,obj_wall,false,true){
	collide_lu = true
} else {
	collide_lu = false
}
if collision_point(x-length_diag,y+length_diag,obj_wall,false,true){
	collide_dl = true
} else {
	collide_dl = false
}
if collision_point(x+length_diag,y-length_diag,obj_wall,false,true){
	collide_ur = true
} else {
	collide_ur = false
}

collide_with = collide_l + collide_d +  collide_r + collide_u
collide_with_diag = collide_lu + collide_dl +  collide_rd + collide_ur

if collide_l and !collide_d and !collide_r and !collide_u {	image_index = 0 image_xscale = -1 image_yscale = 1 image_angle = 0 }
if !collide_l and !collide_d and collide_r and !collide_u { image_index = 0 image_xscale = 1 image_yscale = 1 image_angle = 0 }
if !collide_l and collide_d and !collide_r and !collide_u { image_index = 0 image_xscale = 1 image_yscale = 1 image_angle = 270  }
if !collide_l and !collide_d and !collide_r and collide_u { image_index = 0 image_xscale = 1 image_yscale = 1 image_angle = 90}

if collide_l and !collide_d and collide_r and !collide_u { image_index = 1 image_xscale = 1 image_yscale = 1 image_angle = 0 }
if !collide_l and collide_d and !collide_r and collide_u { image_index = 1 image_xscale = 1 image_yscale = 1 image_angle = 90 }

if !collide_l and !collide_d and !collide_r and !collide_u { image_index = 5 image_xscale = 1 image_yscale = 1 image_angle = 0 }

if !collide_l and !collide_d and collide_r and collide_u and !collide_ur { image_index = 2 image_xscale = 1 image_yscale = 1 image_angle = 0}
if collide_l and !collide_d and !collide_r and collide_u and !collide_lu { image_index = 2 image_xscale = -1 image_yscale = 1 image_angle = 0}
if collide_l and collide_d and !collide_r and !collide_u and !collide_dl { image_index = 2 image_xscale = -1 image_yscale = -1 image_angle = 0}
if !collide_l and collide_d and  collide_r and !collide_u and !collide_rd { image_index = 2 image_xscale = 1 image_yscale = -1  image_angle = 0}

if collide_l and collide_d and collide_r and collide_u { image_index = 4 image_xscale = 1 }

if !collide_l and collide_d and collide_r and collide_u and (!collide_rd and !collide_ur) { image_index = 3 image_xscale = 1 image_yscale = 1 image_angle = 270}
if collide_l and collide_d and !collide_r and collide_u and (!collide_lu and !collide_dl) { image_index = 3 image_xscale = 1 image_yscale = 1 image_angle = 90}
if collide_l and !collide_d and collide_r and collide_u and (!collide_lu and !collide_ur) { image_index = 3 image_xscale = 1 image_angle = 0 image_yscale = 1}
if collide_l and collide_d and collide_r and !collide_u and (!collide_dl and !collide_rd) { image_index = 3 image_xscale = 1 image_angle = 0 image_yscale = -1}


if !collide_l and collide_d and collide_r and collide_u and collide_rd and collide_ur { image_index = 7 image_xscale = 1 image_yscale = 1 image_angle = 0}
if collide_l and collide_d and !collide_r and collide_u and collide_dl and collide_lu { image_index = 7 image_xscale = 1 image_yscale = 1 image_angle = 180}
if collide_l and !collide_d and collide_r and collide_u and collide_ur and collide_lu { image_index = 7 image_xscale = 1 image_angle = 90 image_yscale = 1}
if collide_l and collide_d and collide_r and !collide_u and collide_dl and collide_rd { image_index = 7 image_xscale = 1 image_yscale = 1 image_angle = 270 }

if collide_l and collide_d and !collide_r and !collide_u and collide_dl {	image_index = 6 image_xscale = -1 image_yscale = -1 image_angle = 0}
if !collide_l and !collide_d and collide_r and collide_u and collide_ur {	image_index = 6 image_xscale = 1 image_yscale = 1 image_angle = 0}
if !collide_l and collide_d and collide_r and !collide_u and collide_rd { image_index = 6 image_xscale = 1 image_yscale = -1  image_angle = 0}
if collide_l and !collide_d and !collide_r and collide_u and collide_lu { image_index = 6 image_xscale = 1 image_yscale = 1 image_angle = 90}



//if collide_l and collide_d and collide_r and collide_u and collide_with > 0 { image_index = 9 image_xscale = 1 image_angle = 90}


if collide_with == 0 {
	image_index = 5
}

if collide_with == 4 and collide_with_diag >= 2  {
	image_xscale = 1 image_yscale = 1 
	image_index = 8
	if !collide_rd and collide_with_diag == 3 {
		image_angle = 270
	} if !collide_dl and collide_with_diag == 3 {
		image_angle = 180
	} if !collide_ur and collide_with_diag == 3 {
		image_angle = 0
	} if !collide_lu and collide_with_diag == 3 {
		image_angle = 90
	}
}

if collide_with == 4 and collide_with_diag == 2 {
		image_xscale = 1 image_yscale = 1 
		image_index = 10
		if !collide_lu and !collide_ur {
			image_angle = 0	
		}
		if !collide_rd and !collide_dl {
			image_angle = 180
		}
		if !collide_dl and !collide_lu {
			image_angle = 90
		} 
		if !collide_ur and !collide_rd {
			image_angle = 270
		}
	}
	
if collide_with == 3 and collide_with_diag == 1 {
	image_index = 11
	if collide_rd and !collide_l { 
		image_xscale = 1 
		image_angle = 90
		image_yscale = -1
	}
	if collide_lu and !collide_d { 
		image_xscale = 1
		image_angle = 0
		image_yscale = 1
	}
	if collide_lu and !collide_r { 
		image_yscale = 1
		image_angle = 90
		image_xscale = -1
	}
	if collide_rd and !collide_u { 
		image_angle = 0
		image_yscale = -1
		image_xscale = -1
	}
	if collide_dl and !collide_u { 
		image_xscale = 1 
		image_angle = 0
		image_yscale = -1
	}
	if collide_dl and !collide_r { 
		image_xscale = 1 
		image_yscale = 1
		image_angle = 90
	}
	if collide_ur and !collide_d {
		image_yscale = 1
		image_angle = 0
		image_xscale = -1
	}
	if collide_ur and !collide_l {
		image_angle = 90
		image_yscale = -1
		image_xscale = -1
	}
}

if collide_with == 4 and collide_with_diag == 2 {
	image_xscale = 1 image_yscale = 1 
	
	if collide_lu and collide_rd {
		image_angle = 0	
		image_index = 12 
	}
	if collide_ur and collide_dl {
		image_angle = 90
		image_index = 12 
	}
}
	
if collide_with_diag >= 4 and collide_with >= 4   {  
	 image_index = 9	
	 image_xscale = 1 image_yscale = 1 image_angle = 0
}
}