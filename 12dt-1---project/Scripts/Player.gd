extends CharacterBody2D

const speed: int = 450

var health: int = 10
var max_hp: int = 10
var direction: Vector2 = Vector2(0.0, 0.0)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") and health < max_hp:
		health += 1
		print(health)
	if event.is_action_pressed("ui_cancel"):
		health -= 1
		print(health)

func _process(delta: float) -> void:
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	
	velocity = direction.normalized() * speed
	
	if health == 0:
		get_tree().reload_current_scene()
	
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Levels/Battle.tscn")
