extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var posicion_inicial: Vector2

func _ready():
	posicion_inicial = global_position

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump input.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction > 0:
		$AnimatedSprite2D.scale.x = 1
	elif direction < 0:
		$AnimatedSprite2D.scale.x = -1

	if direction:
		velocity.x = direction * SPEED
		if is_on_floor(): 
			$AnimatedSprite2D.play("derecha")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			$AnimatedSprite2D.play("Inicio")

	# ANIMACIÓN
	if not is_on_floor():
		$AnimatedSprite2D.play("salto")
	elif direction:
		$AnimatedSprite2D.play("derecha")
	else:
		$AnimatedSprite2D.play("Inicio")

	#  Verifica si cae al vacío y lo recoloca
	if global_position.y > 1000:
		global_position = posicion_inicial
		velocity = Vector2.ZERO

	move_and_slide()

	
