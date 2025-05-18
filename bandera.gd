extends Sprite2D

@onready var ui_nivel_completado = get_node("/root/Game/UI/NivelCompletadoLabel")

func _ready():
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("jugador"):
		ui_nivel_completado.text = "¡Nivel completado!"
		ui_nivel_completado.visible = true
		queue_free() # Elimina la bandera del juego
