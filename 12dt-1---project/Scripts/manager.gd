extends Node

var max_hp: int = 10
var hp: int = 10
var min_atk = 2
var max_atk = 3
var def
var enemy_order: int = 1
var level_number: int = 1
var inventory: int = 3

var enemy_info = {
	"Alien Robo": {"hp": 15, "atk": [1,2]},
	"Alien Robo DX": {"hp": 30, "atk": [3,6]}
}
