extends Area2D

func _ready():
	if Manager.enemy_order != Manager.level_number:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Levels/Battle.tscn")
