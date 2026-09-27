extends CharacterBody2D

# Constant value for speed of player
const SPEED: int = 175

# Vector2 variable to handle player movement
var direction: Vector2 = Vector2(0.0, 0.0)

# Execute every delta while game is running
func _process(delta: float) -> void:
	# Handle input to get player direction
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	# Normalised vector value for direction
	velocity = direction.normalized() * SPEED
	
	# If player has just defeated enemy
	if Manager.just_won:
		# Move the player to the win location
		global_position = Manager.win_location
		# Player has no longer 'just' won
		Manager.just_won = false
	# Player movement
	move_and_slide()

# Change level to cave when enter cave mouth
func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Levels/Main Levels/Past_Cave.tscn")
		Manager.level_number += 1


# Change level to battle once entered enemy Area2D
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Levels/Other Levels/Battle.tscn")


# Move player to top of mountain when they go through the tunnel
func _on_area_2d_3_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		# Move player to correct position
		global_position = Vector2(100, -200)


#Change level to battle once Pteranodon Area2D entered
func _on_pteranodon_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Levels/Other Levels/Battle.tscn")


# Change level to Cretaceous once enter time machine and level up
func _on_area_time_machine_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Levels/Main Levels/Cretaceous.tscn")
# Remove Magic Numbers!
		Manager.level_number += 1
		Manager.max_hp += 5
		Manager.min_atk += 1
		Manager.max_atk += 1
		Manager.hp += 5
		Manager.heal_int += 2


# Change level to Cretaceous Cave once entered
func _on_cretaceous_cave_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Levels/Main Levels/Cretaceous_Cave.tscn")
		Manager.level_number += 1


# Change level to Archaean once entered Magic spiral and level up
func _on_archaean_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Levels/Main Levels/Archaean.tscn")
# Remove Magic Numbers!
		Manager.level_number += 1
		Manager.max_hp += 5
		Manager.min_atk += 2
		Manager.max_atk += 2
		Manager.hp += 5
		Manager.heal_int += 2


# Change level to battle when entered T-Rex
func _on_trex_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Levels/Other Levels/Battle.tscn")


# Change level to Final Place once entered door
func _on_door_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Levels/Main Levels/Final_Place.tscn")


# Change level to Battle once entered Final Boss
func _on_final_boss_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Levels/Other Levels/Battle.tscn")
