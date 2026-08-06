extends CharacterBody2D

const SPEED: int = 175

var direction: Vector2 = Vector2(0.0, 0.0)

func _process(delta: float) -> void:
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	
	velocity = direction.normalized() * SPEED
	
	move_and_slide()

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Levels/Past_Cave.tscn")
		Manager.level_number += 1


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Levels/Battle.tscn")
