extends Node2D

@onready var anim = $AnimationPlayer

@onready var timer = $Timer

func _ready():
	anim.play("fondoLoading")
	timer.start()
	
	await timer.timeout
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	
