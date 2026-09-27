extends Node

# Maximum base HP of player
var max_hp: int = 10
# Current HP of player
var hp: int = 10
# Minimum base attack range value
var min_atk = 2
# Maximum base attack range value
var max_atk = 3
# Potential defense variable
#var def
# Enemy order to change enemy stats
var enemy_order: int = 1
var level_number: int = 1
# Amount of items still in inventory
var inventory: int = 3
# Tell game if player has just won
var just_won: bool = false
# Names of enemies used for dictionary access
var enemy_1: String = "Alien Robo"
var enemy_2: String = "Alien Robo DX"
var enemy_3: String = "Pteranodon"
var enemy_4: String = "T-Rex"
var enemy_5: String = "Your Shadow"
# Enemy label used in battle
var enemy_label: String
# Enemy stats used to access inside enemy_info dictionary
var enemy_stats: Dictionary
# Used to access health inside enemy_info dictionary
var enemy_max_health: int
# Used to access attack range inside enemy_info dictionary
var enemy_atk: Array
# Used to access enemy position inside enemy_info dictionary
var enemy_pos: int
# Assign numbers to levels
var level: int = 1
var cave: int = 2
var cretaceous: int = 3
var cretaceous_cave: int = 4
var archaean: int = 5
# Variable for location sent to when players win battle
var win_location: Vector2
# Used to assign health inside enemy_info dictionary
var hp_string: String = "hp"
# Used to assign health inside enemy_info dictionary
var atk_string: String = "atk"
# Used to assign position inside enemy_info dictionary
var pos_string: String = "pos"
# Variable for healing amount when item used in battle
var heal_int: int = 4


# Dictionary containing enemy info
var enemy_info = {
	# Alien Robo name
	"Alien Robo": {
		# Alien Robo max health
		hp_string: 10,
		# Alien robo attack range
		atk_string: [1,2],
		# Alien robo position
		pos_string: 1
	},
	# Alien Robo DX name
	"Alien Robo DX": {
		# Alien Robo DX max health
		hp_string: 12,
		# Alien Robo DX attack range
		atk_string: [2,3],
		# Alien Robo DX position
		pos_string: 2
	},
	# Pteranodon name
	"Pteranodon": {
		# Pteranodon max health
		hp_string: 15,
		# Pteranodon attack range
		atk_string: [2,4],
		# Pteranodon position
		pos_string: 3
	},
	# T-Rex name
	"T-Rex": {
		# T-Rex max health
		hp_string: 20,
		# T-Rex attack range
		atk_string: [3, 5],
		# T-Rex position
		pos_string: 4
	},
	# Name of Final Boss
	"Your Shadow": {
		# Final Boss HP
		hp_string: 30,
		# Final boss attack range
		atk_string: [5, 8],
		# Final boss position
		pos_string: 5
	}
}

# Need to make some of this into functions
func _check_order():
	if enemy_order == 1:
		enemy_stats = enemy_info[enemy_1]
		enemy_max_health = enemy_stats[hp_string]
		enemy_atk = enemy_stats[atk_string]
		enemy_pos = enemy_stats[pos_string]
		enemy_label = enemy_1
		win_location = Vector2(-100, -200)
	if enemy_order == 2:
		enemy_stats = enemy_info[enemy_2]
		enemy_max_health = enemy_stats[hp_string]
		enemy_atk = enemy_stats[atk_string]
		enemy_pos = enemy_stats[pos_string]
		enemy_label = enemy_2
		win_location = Vector2(150, 50)
	if enemy_order == 3:
		enemy_stats = enemy_info[enemy_3]
		enemy_max_health = enemy_stats[hp_string]
		enemy_atk = enemy_stats[atk_string]
		enemy_pos = enemy_stats[pos_string]
		enemy_label = enemy_3
		win_location = Vector2(500, 500)
	if enemy_order == 4:
		enemy_stats = enemy_info[enemy_4]
		enemy_max_health = enemy_stats[hp_string]
		enemy_atk = enemy_stats[atk_string]
		enemy_pos = enemy_stats[pos_string]
		enemy_label = enemy_4
		win_location = Vector2(200, 100)
	if enemy_order == 5:
		enemy_stats = enemy_info[enemy_5]
		enemy_max_health = enemy_stats[hp_string]
		enemy_atk = enemy_stats[atk_string]
		enemy_pos = enemy_stats[pos_string]
		enemy_label = enemy_5
		win_location = Vector2(0, 0)
