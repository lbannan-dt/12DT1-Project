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
var just_won: bool = false
var enemy_1: String = "Alien Robo"
var enemy_2: String = "Alien Robo DX"
var enemy_3: String = "Pteranodon"
var enemy_label: String
var enemy_stats: Dictionary
var enemy_max_health: int
var enemy_atk: Array
var enemy_pos: int
var level: int = 1
var cave: int = 2

var enemy_info = {
	"Alien Robo": {
		"hp": 10,
		"atk": [1,2],
		"pos": 1
	},
	"Alien Robo DX": {
		"hp": 15,
		"atk": [2,3],
		"pos": 2
	},
	"Pteranodon": {
		"hp": 15,
		"atk": [4,5],
		"pos": 3
	}
}

# Need to make some of this into functions
func _check_order():
	if enemy_order == 1:
		enemy_stats = enemy_info[enemy_1]
		enemy_max_health = enemy_stats["hp"]
		enemy_atk = enemy_stats["atk"]
		enemy_pos = enemy_stats["pos"]
		enemy_label = enemy_1
	if enemy_order == 2:
		enemy_stats = enemy_info[enemy_2]
		enemy_max_health = enemy_stats["hp"]
		enemy_atk = enemy_stats["atk"]
		enemy_pos = enemy_stats["pos"]
		enemy_label = enemy_2
	if enemy_order == 3:
		enemy_stats = enemy_info[enemy_3]
		enemy_max_health = enemy_stats["hp"]
		enemy_atk = enemy_stats["atk"]
		enemy_pos = enemy_stats["pos"]
		enemy_label = enemy_3
