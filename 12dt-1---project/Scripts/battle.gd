extends Control

@onready var enemy_bar = $"VBoxContainer/Enemy Health"
@onready var player_bar = $"VBoxContainer/Player Health"
@onready var text = $VBoxContainer/Text
@onready var attack_button = $VBoxContainer/HBoxContainer/Attack
@onready var item_button = $VBoxContainer/HBoxContainer/Items

var enemy_hp = 10 * Manager.enemy_order
var enemy_max_hp = 10 * Manager.enemy_order
var player_hp = Manager.hp
var player_max_hp = Manager.max_hp
var remaining_items = Manager.inventory
var heal_number: int
var healed: bool = false

func _ready() -> void:
	enemy_bar.max_value = enemy_max_hp
	enemy_bar.value = enemy_max_hp
	player_bar.max_value = player_max_hp
	player_bar.value = player_hp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _attack():
	item_button.disabled = true
	attack_button.disabled = true
	var damage = randi_range(2,4)
	enemy_hp -= damage
	enemy_bar.value = enemy_hp
	text.text = "You attacked enemy and dealt %d damage!" %damage
	await get_tree().create_timer(1.0).timeout
	
	if enemy_hp <= 0:
		text.text = "You defeated enemy!"
		await get_tree().create_timer(1.0).timeout
		_win_die()
		Manager.enemy_order += 1
		return
		
	var enemy_damage = randi_range(1*Manager.enemy_order,2*Manager.enemy_order)
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
		_win_die()
		return
		
	attack_button.disabled = false
	item_button.disabled = false

func _use_item():
	item_button.disabled = true
	var heal: int = 4
	if player_hp <= 6:
		player_hp += heal
		player_bar.value = player_hp
		remaining_items -= 1
		text.text = "You healed %dhp" %heal
		await get_tree().create_timer(1.0).timeout
		text.text = "You have %d uses left" %remaining_items
		await get_tree().create_timer(1.0).timeout
		healed = true
	if player_hp > 6 and not healed:
		heal_number = 10 - player_hp
		player_hp = 10
		player_bar.value = player_hp
		remaining_items -= 1
		text.text = "You healed %dhp" %heal_number
		await get_tree().create_timer(1.0).timeout
		text.text = "You have %d uses left" %remaining_items
		await get_tree().create_timer(1.0).timeout
	
	var enemy_damage = randi_range(1*Manager.enemy_order,2*Manager.enemy_order)
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
		_win_die()
		return
	
	item_button.disabled = false
	attack_button.disabled = false
	healed = false


func _on_attack_pressed() -> void:
	_attack()

func _win_die():
	if Manager.level_number == 1:
		get_tree().change_scene_to_file("res://Levels/Level.tscn")
	elif Manager.level_number == 2:
		get_tree().change_scene_to_file("res://Levels/Level_2.tscn")


func _on_items_pressed() -> void:
	if remaining_items > 0:
		_use_item()
	else:
		text.text = "You have no remaining items!"
		await get_tree().create_timer(1.0).timeout
		text.text = "Your turn"
