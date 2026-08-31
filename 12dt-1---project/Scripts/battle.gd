extends Control

const WAIT = 1.5

# Assign variables to nodes
# Assign variable enemy_name to 'Enemy Name' Label node
@onready var enemy_name = $"VBoxContainer/Enemy Name"
# Assign variable enemy_bar to 'Enemy Health' ProgressBar node
@onready var enemy_bar = $"VBoxContainer/Enemy Health"
# Assign variable player bar to 'Player Health' ProgressBar node
@onready var player_bar = $"VBoxContainer/Player Health"
# Assign variable text to 'Text' Label node
@onready var text = $Text
# Assign variable attack_button to 'Attack' Button node
@onready var attack_button = $VBoxContainer/HBoxContainer/Attack
# Assign variable item_button to 'Items' Button node
@onready var item_button = $VBoxContainer/HBoxContainer/Items
#Assign variable enemy_1_sprite to Alien Robo sprite
@onready var enemy_1_sprite = $"Alien Robo"
#Assign variable enemy_2_sprite to Alien Robo DX sprite
@onready var enemy_2_sprite = $"Alien Robo DX"
@onready var enemy_3_sprite = $"Pteranodon"
@onready var background = $ColorRect

# Enemy HP
var enemy_hp: int
# Maximum enemy HP
var enemy_max_hp: int
# Current player HP
var player_hp = Manager.hp
# Maximum player HP
var player_max_hp = Manager.max_hp
# Amount of items left
var remaining_items = Manager.inventory
# Amount of health restored by item
var heal_number: int
# Check if player is healed
var healed: bool = false
var enemy_dead: bool = false
var player_dead: bool = false
var centre_pos: Vector2 = Vector2(170, 112)

func _move_sprites():
	if Manager.enemy_order == 2:
		enemy_1_sprite.hide()
		enemy_2_sprite.show()
		enemy_2_sprite.global_position = centre_pos
		background.color = Color(0, 0, 0.25, 0.5)
	elif Manager.enemy_order == 3:
		enemy_1_sprite.hide()
		enemy_2_sprite.hide()
		enemy_3_sprite.global_position = centre_pos
		background.color = Color(0, 0.5, 0.5, 0.5)

# Start battle
func _ready() -> void:
	Manager._check_order()
	_move_sprites()
	enemy_name.text = Manager.enemy_label
	enemy_max_hp = Manager.enemy_max_health
	enemy_hp = enemy_max_hp
	# Fill enemy HP bar
	enemy_bar.max_value = enemy_max_hp
	enemy_bar.value = enemy_max_hp
	# Fill player HP bar
	player_bar.max_value = player_max_hp
	player_bar.value = player_hp

# Check if player dies
func _check_death():
	# They will be dead if HP <= 0
	if player_hp <= 0:
		player_dead = true
		# Disable player options
		item_button.disabled = true
		attack_button.disabled = true
		# Output death
		text.text = "You were defeated..."
		# Timer
		await get_tree().create_timer(WAIT).timeout
		# End battle
		_win_die()
		# End script
		return

# Check enemy death
func _check_enemy_death():
	# Enemy will be dead if its HP <= 0
	if enemy_hp <= 0:
		enemy_dead = true
		# Output result
		text.text = "You defeated enemy!"
		# Timer
		await get_tree().create_timer(WAIT).timeout
		# End battle
		_win_die()
		# Change enemy order
		Manager.enemy_order += 1
		# End script
		return

# Enemy turn
func _enemy_attack():
	# Disable player actions
	attack_button.disabled = true
	item_button.disabled = true
	# Enemy attack by enemy number
	var enemy_damage = randi_range(
		Manager.enemy_atk[0],
		Manager.enemy_atk[1]
	)
	# Output text
	text.text = "Enemy attacks you"
	# Timer
	await get_tree().create_timer(WAIT).timeout
	# Change player HP
	player_hp -= enemy_damage
	player_bar.value = player_hp
	# Output damage amount
	text.text = "Enemy dealt %d damage!" %enemy_damage
	# Timer
	await get_tree().create_timer(WAIT).timeout
	# Check if player dies
	_check_death()
	if not player_dead:
		# Let player know it is there turn
		text.text = "Your turn"
		# Timer
		await get_tree().create_timer(0.5).timeout
		# Enable player options
		attack_button.disabled = false
		item_button.disabled = false

# Player attack
func _attack():
	# Disable player options
	item_button.disabled = true
	attack_button.disabled = true
	# Inflict random damge between minimum and maximum attack
	var damage = randi_range(Manager.min_atk, Manager.max_atk)
	# Deal damage
	enemy_hp -= damage
	enemy_bar.value = enemy_hp
	# Output damage amount
	text.text = "You attacked enemy and dealt %d damage!" %damage
	# Timer
	await get_tree().create_timer(WAIT).timeout
	# Check enemy death
	_check_enemy_death()
	if enemy_dead:
		Manager.just_won = true
		return
	else:
		# Start enemy turn
		_enemy_attack()

# Player use healing item
func _use_item():
	# Disable player options
	item_button.disabled = true
	attack_button.disabled = true
	# Maximum healing value
	var heal: int = 4
	# Conditional if HP will not be greater maximum if healed
	if player_hp <= Manager.max_hp - heal:
		# Add healing value to HP
		player_hp += heal
		# Show HP
		player_bar.value = player_hp
		# Reduce items number
		remaining_items -= 1
		# Output healing
		text.text = "You healed %dhp" %heal
		# Timer
		await get_tree().create_timer(WAIT).timeout
		# Output remaining items
		text.text = "You have %d uses left" %remaining_items
		# Timer
		await get_tree().create_timer(WAIT).timeout
		# Show player healed
		healed = true
		
	# Conditional if HP will be greater than maximum if healed
	if player_hp > Manager.max_hp - heal and not healed:
		# Create new healing quantity based on remaining HP
		heal_number = Manager.max_hp - player_hp
		# Set HP to maximum
		player_hp = Manager.max_hp
		# Show HP
		player_bar.value = player_hp
		# Reduce items number
		remaining_items -= 1
		# Ouput healing quantity
		text.text = "You healed %dhp" %heal_number
		# Timer
		await get_tree().create_timer(WAIT).timeout
		# Output remaining items
		text.text = "You have %d uses left" %remaining_items
		# Timer
		await get_tree().create_timer(WAIT).timeout
	
	# Enemy turn
	_enemy_attack()

# Perform attack function when press Attack button
func _on_attack_pressed() -> void:
	_attack()

# End level
func _win_die():
	if Manager.level_number == Manager.level:
		get_tree().change_scene_to_file("res://Levels/Main Levels/Level.tscn")
	if Manager.level_number == Manager.cave:
		get_tree().change_scene_to_file("res://Levels/Main Levels/Past_Cave.tscn")


# Use item when Items button pressed
func _on_items_pressed() -> void:
	# Check if there are remaining items
	if remaining_items > 0:
		# Use item
		_use_item()
	# If there are no items remaining
	else:
		# Output lack of items
		text.text = "You have no remaining items!"
		# Timer
		await get_tree().create_timer(1.0).timeout
		# Restart turn
		text.text = "Your turn"
