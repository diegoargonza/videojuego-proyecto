extends Area2D

@onready var label_completado = get_node("/root/Game/CanvasLayer/Label")

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("jugador"):
		label_completado.text = "¡Nivel completado!"
		label_completado.visible = true
		queue_free()
