extends Node

# Maximum base HP of player
var max_hp: int = 10
# Current HP of player
var hp: int = 10
# Minimum base attack range value
var min_atk = 2
# Maximum base attack range value
var max_atk = 3
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


# Function to level up player
func _level_up():
	# Level of player
	var level: int = 1
	# Amount of health incresed
	var hp_increase: int = 5
	# Amount of attack increase
	var atk_increase: int = 1
	# Amount of healing items increased
	var heal_increase: int = 1
	# Conditional to check which level player is on
	if level == 1:
		# Increase max health
		Manager.max_hp += hp_increase
		# Increase attack
		Manager.min_atk += atk_increase
		Manager.max_atk += atk_increase
		# Increase health
		Manager.hp += hp_increase
		# Increase amount of healing items
		Manager.heal_int += heal_increase
	# All other level ups
	if level > 1:
		# Increase amount attack is increased by
		atk_increase += 1
		# Increase max health
		Manager.max_hp += hp_increase
		# Increase attack
		Manager.min_atk += atk_increase
		Manager.max_atk += atk_increase
		# Increase health
		Manager.hp += hp_increase
		# Increase amount of healing items
		Manager.heal_int += heal_increase


# Check order of enemies in order to have correct battles
func _check_order():
	# For the enemy in the first level (Alien Robo)
	if enemy_order == level:
		# Get enemy stats from enemy_info dictionary
		enemy_stats = enemy_info[enemy_1]
		# Get enemy max health from enemy_stats dictionary
		enemy_max_health = enemy_stats[hp_string]
		# Get enemy attack range from enemy_stats dictionary
		enemy_atk = enemy_stats[atk_string]
		# Get enemy position from enemy_stats dictionary
		enemy_pos = enemy_stats[pos_string]
		# Assign enemy label to enemy 1
		enemy_label = enemy_1
		# Assign win location to Vector2 location
		win_location = Vector2(-100, -200)
	# For the enemy in the cave (Alien Robo DX)
	if enemy_order == cave:
		# Get enemy stats from enemy_info dictionary
		enemy_stats = enemy_info[enemy_2]
		# Get enemy max health from enemy_stats dictionary
		enemy_max_health = enemy_stats[hp_string]
		# Get enemy attack range from enemy_stats dictionary
		enemy_atk = enemy_stats[atk_string]
		# Get enemy position from enemy_stats dictionary
		enemy_pos = enemy_stats[pos_string]
		# Assign enemy label to enemy 2
		enemy_label = enemy_2
		win_location = Vector2(150, 50)
	# For the enemy in the Cretaceous overworld (Pteranodon)
	if enemy_order == cretaceous:
		# Get enemy stats from enemy_info dictionary
		enemy_stats = enemy_info[enemy_3]
		# Get enemy max health from enemy_stats dictionary
		enemy_max_health = enemy_stats[hp_string]
		# Get enemy attack range from enemy_stats dictionary
		enemy_atk = enemy_stats[atk_string]
		# Get enemy position from enemy_stats dictionary
		enemy_pos = enemy_stats[pos_string]
		# Assign enemy label to enemy 3
		enemy_label = enemy_3
		# Assign win location to Vector2 location
		win_location = Vector2(500, 500)
	# For the enemy in the Cretaceous cave (T-Rex)
	if enemy_order == cretaceous_cave:
		# Get enemy stats from enemy_info dictionary
		enemy_stats = enemy_info[enemy_4]
		# Get enemy max health from enemy_stats dictionary
		enemy_max_health = enemy_stats[hp_string]
		# Get enemy attack range from enemy_stats dictionary
		enemy_atk = enemy_stats[atk_string]
		# Get enemy position from enemy_stats dictionary
		enemy_pos = enemy_stats[pos_string]
		# Assign enemy label to enemy 4
		enemy_label = enemy_4
		# Assign win location to Vector2 location
		win_location = Vector2(200, 100)
	# For the enemy in the Archaean (Final Boss/Your Shadow)
	if enemy_order == archaean:
		# Get enemy stats from enemy_info dictionary
		enemy_stats = enemy_info[enemy_5]
		# Get enemy max health from enemy_stats dictionary
		enemy_max_health = enemy_stats[hp_string]
		# Get enemy attack range from enemy_stats dictionary
		enemy_atk = enemy_stats[atk_string]
		# Get enemy position from enemy_stats dictionary
		enemy_pos = enemy_stats[pos_string]
		# Assign enemy label to enemy 5
		enemy_label = enemy_5
		# Assign win location to Vector2 location
		win_location = Vector2(0, 0)
