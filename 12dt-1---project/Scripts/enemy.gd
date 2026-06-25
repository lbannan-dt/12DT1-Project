extends Area2D

func _ready():
	if Manager.enemy_order != Manager.level_number:
		queue_free()
