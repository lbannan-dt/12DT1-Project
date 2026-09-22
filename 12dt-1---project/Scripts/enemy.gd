extends Area2D

func _ready():
	if Manager.just_won:
		queue_free()
		return
