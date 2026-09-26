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
var enemy_4: String = "T-Rex"
var enemy_label: String
var enemy_stats: Dictionary
var enemy_max_health: int
var enemy_atk: Array
var enemy_pos: int
var level: int = 1
var cave: int = 2
var cretaceous: int = 3
var cretaceous_cave: int = 4
var win_location: Vector2
var hp_string: String = "hp"
var atk_string: String = "atk"
var pos_string: String = "pos"

var enemy_info = {
	"Alien Robo": {
		hp_string: 10,
		atk_string: [1,2],
		pos_string: 1
	},
	"Alien Robo DX": {
		hp_string: 12,
		atk_string: [2,3],
		pos_string: 2
	},
	"Pteranodon": {
		hp_string: 15,
		atk_string: [2,4],
		pos_string: 3
	},
	"T-Rex": {
		hp_string: 25,
		atk_string: [3, 5],
		pos_string: 4
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
		win_location = Vector2(500, 500)
