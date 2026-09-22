extends CharacterBody2D


const SPEED: int = 175

var direction: Vector2 = Vector2(0.0, 0.0)

func _process(delta: float) -> void:
	# Handle input to get player direction
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	# Normalised vector value for direction
	velocity = direction.normalized() * SPEED
	
	if Manager.just_won:
		global_position = Manager.win_location
		Manager.just_won = false
	
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


func _on_area_2d_3_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		global_position = Vector2(100, -200)


func _on_pteranodon_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Levels/Other Levels/Battle.tscn")

func _on_area_time_machine_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Levels/Main Levels/Cretaceous.tscn")
# Remove Magic Numbers!
		Manager.level_number += 1
		Manager.max_hp += 5
		Manager.min_atk += 1
		Manager.max_atk += 1
		Manager.hp += 5
