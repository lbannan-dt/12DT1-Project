extends CharacterBody2D

const speed: int = 450

var direction: Vector2 = Vector2(0.0, 0.0)

func _process(delta: float) -> void:
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	
	velocity = direction.normalized() * speed
	
	move_and_slide()
	print(global_position)

func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Levels/Battle.tscn")
