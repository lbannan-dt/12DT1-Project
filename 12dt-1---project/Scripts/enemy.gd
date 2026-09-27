extends Area2D

# Will remove overworld sprite if player has just defeated them
func _ready():
	# Conditional if the player has just defeated enemy
	if Manager.just_won:
		# Remove overworld sprite
		queue_free()
		# End script
		return
