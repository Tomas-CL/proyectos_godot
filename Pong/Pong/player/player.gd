extends CharacterBody2D

var speed = 500

func _physics_process(delta):
	if is_mobile():
		handle_touch(delta)
	else:
		handle_pc(delta)

func is_mobile():
	return OS.get_name() == "Android" or OS.get_name() == "iOS"
	
func handle_pc(delta):
	velocity.y = 0

	if Input.is_action_pressed("ui_up"):
		velocity.y = -speed
	elif Input.is_action_pressed("ui_down"):
		velocity.y = speed

	move_and_collide(velocity * delta)

func handle_touch(delta):
	# Detectar si hay un dedo tocando la pantalla
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		return

	var touch_pos = get_global_mouse_position()		

# (Opcional) Solo si toca el lado izquierdo
	if touch_pos.x > get_viewport_rect().size.x / 2:
		return
