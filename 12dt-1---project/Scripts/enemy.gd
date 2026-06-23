extends Area2D

func _ready() -> void:
	if Manager.enemy_order != Manager.level_number:
		queue_free()
