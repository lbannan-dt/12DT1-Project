extends Control

@onready var enemy_bar = $"VBoxContainer/Enemy Health"
@onready var player_bar = $"VBoxContainer/Player Health"
@onready var text = $VBoxContainer/Text
@onready var attack_button = $VBoxContainer/ButtonRow/Attack

var enemy_hp = 10
var enemy_max_hp = 10
var player_hp = 10
var player_max_hp = 10

func _ready() -> void:
	enemy_bar.max_value = enemy_max_hp
	enemy_bar.value = enemy_max_hp
	player_bar.max_value = player_max_hp
	player_bar.value = player_hp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _attack():
	var damage = 2
	enemy_hp -= damage
	enemy_bar.value = enemy_hp
	text.text = "You attacked enemy and dealt 2 damage!"
	
	if enemy_hp <= 0:
		text.text = "You defeated enemy!"
		get_tree().change_scene_to_file("res://Levels/Level.tscn")
		return
		
	var enemy_damage = 1
	player_hp -= enemy_damage
	player_bar.value = player_hp
	text.text = "Enemy attacks you and deals 1 damage!"
	
	if player_hp <= 0:
		text.text = "You were defeated..."
		get_tree().change_scene_to_file("res://Levels/Level.tscn")
		return
		


func _on_attack_pressed() -> void:
	_attack()
