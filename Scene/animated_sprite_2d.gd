extends AnimatedSprite2D
const SPEED = 40
var dir = 1
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var ray_cast_2d_2: RayCast2D = $RayCast2D2
@onready var ray_cast_2d_right: RayCast2D = $RayCast2DRIGHTTILT
@onready var ray_cast_2d_2_left: RayCast2D = $RayCast2DLEFTTILT
@onready var ass: AnimatedSprite2D = $"."

func _physics_process(delta):
	if ray_cast_2d.is_colliding():
		dir = -1
		ass.flip_h = true
	
	elif ray_cast_2d_2.is_colliding():
		dir = 1 
		ass.flip_h = false
		
	elif not ray_cast_2d_right.is_colliding():
		dir *= -1
		ass.flip_h = true
	
	elif not ray_cast_2d_2_left.is_colliding():
		dir *= -1
		ass.flip_h = false
		
	position.x += SPEED * delta * dir
	
