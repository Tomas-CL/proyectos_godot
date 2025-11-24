extends CharacterBody2D

@onready var animation_player = $AnimationPlayer
@onready var sprite_2d = $Sprite2D
@onready var timer = $Timer

var gravity = 980.0
var bounce_speed = 800.0
var speed_scale = 5.0
var is_waiting = false

func _process(delta):
	if not animation_player.is_playing():
		# Mapeo de rango (-800, 800) a (0, 1)
		var t = clamp((velocity.y + bounce_speed) / (2 * bounce_speed), 0, 1)
		# Escalado con interpolación según velocidad (perdonen por la hardcodeada)
		var scale_x = lerp(1.2, 0.8, t)
		var scale_y = lerp(0.8, 1.2, t)
		var target_scale = Vector2(scale_x, scale_y)
		sprite_2d.scale = sprite_2d.scale.lerp(target_scale, speed_scale * delta)

func _physics_process(delta):
	move_and_slide()
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		bounce()

func bounce():
	if not is_waiting:
		velocity.y = 0
		timer.start()
		animation_player.play("bounce")
		is_waiting = true
	

func _on_timer_timeout():
	velocity.y = -bounce_speed
	is_waiting = false
