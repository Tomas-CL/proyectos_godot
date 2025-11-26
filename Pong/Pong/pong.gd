extends Node2D

const CENTER = Vector2(640, 360)
var player_score = 0
var computer_score = 0

func _ready():
	if OS.get_name() == "Android" or OS.get_name() == "iOS":
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
# Cuando la bola entra en la portería izquierda
func _on_go_left_body_entered(body):
	computer_score += 1
	$computerscore.text = str(computer_score)
	reset_game()

# Cuando la bola entra en la portería derecha
func _on_go_right_body_entered(body):
	player_score += 1
	$playerscore.text = str(player_score)
	reset_game()

# Resetea posiciones y velocidad de la bola
func reset_game():
	# Posición central
	$ball.position = CENTER
	$Player.position = Vector2($Player.position.x, CENTER.y)
	$Computer.position = Vector2($Computer.position.x, CENTER.y)
	
	# Velocidad aleatoria de la bola
	$ball.call("set_ball_velocity")
