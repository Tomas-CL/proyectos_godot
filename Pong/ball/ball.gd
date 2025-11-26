extends CharacterBody2D

var speed = 500

func _ready():
	set_ball_velocity()

func set_ball_velocity():
	if randi() % 2 == 0:
		velocity.x = 1
	else:
		velocity.x =-1
		
	if randi() % 2 == 0:
		velocity.y = 1
	else:
		velocity.y =-1
	
	velocity *= speed
	
	
func  _physics_process(delta):
	var colision_info = move_and_collide(velocity *delta)
	
	if colision_info:
		velocity = velocity.bounce(colision_info.get_normal())
