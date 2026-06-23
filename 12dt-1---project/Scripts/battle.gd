extends Control

@onready var enemy_bar = $"VBoxContainer/Enemy Health"
@onready var player_bar = $"VBoxContainer/Player Health"
@onready var text = $VBoxContainer/Text
@onready var attack_button = $VBoxContainer/HBoxContainer/Attack
@onready var item_select = $VBoxContainer/HBoxContainer/Items

var enemy_hp = 10 * Manager.enemy_order
var enemy_max_hp = 10 * Manager.enemy_order
var player_hp = Manager.hp
var player_max_hp = Manager.max_hp

func _ready() -> void:
	enemy_bar.max_value = enemy_max_hp
	enemy_bar.value = enemy_max_hp
	player_bar.max_value = player_max_hp
	player_bar.value = player_hp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _attack():
	attack_button.disabled = true
	var damage = randi_range(4,6)
	enemy_hp -= damage
	enemy_bar.value = enemy_hp
	text.text = "You attacked enemy and dealt %d damage!" %damage
	await get_tree().create_timer(1.0).timeout
	
	if enemy_hp <= 0:
		text.text = "You defeated enemy!"
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://Levels/Level.tscn")
		Manager.enemy_order += 1
		return
		
	var enemy_damage = randi_range(1,2)
	text.text = "Enemy attacks you"
	await get_tree().create_timer(1.0).timeout
	player_hp -= enemy_damage
	player_bar.value = player_hp
	text.text = "Enemy dealt %d damage!" %enemy_damage
	await get_tree().create_timer(1.0).timeout
	text.text = "Your turn"
	
	if player_hp <= 0:
		text.text = "You were defeated..."
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://Levels/Level.tscn")
		return
		
	attack_button.disabled = false

func _on_attack_pressed() -> void:
	_attack()
