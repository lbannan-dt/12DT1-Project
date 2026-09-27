extends Area2D

# Will remove overworld sprite if player has just defeated them
func _ready():
	# Conditional if the player has just defeated enemy
	if Manager.just_won:
		# Remove overworld sprite
		queue_free()
		# End script
		return


func _on_exit_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Levels/Other Levels/Win_Screen.tscn")
