extends CharacterBody2D

const speed: int = 450

#This variable will be appended to list of properties of an item
#and removed when used: item used -> item effect -> item removed
var is_in_player_inventory : bool
#List includes item type and amount of health it heals
var food_item = ["food", 2]
#List includes item type and increase in defense
var defense_item = ["shield", 1]
#List includes item type and increase in attack
var attack_item = ["weapon", 1]
@export var health: int = 10
@export var max_hp: int = 10
var attack: int = 1
var level: int = 1
var direction: Vector2 = Vector2(0.0, 0.0)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") and health < max_hp:
		health += 1
		print(health)
	if event.is_action_pressed("ui_cancel"):
		health -= 1
		print(health)
	if event.is_action_pressed("ui_undo"):
		max_hp += 10
		print("Max HP increased to:", max_hp)

func _process(delta: float) -> void:
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	
	velocity = direction.normalized() * speed
	
	if health == 0:
		get_tree().reload_current_scene()
	
	move_and_slide()
