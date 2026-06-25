extends Node

var max_hp: int = 10
var hp: int = 10
var atk = [1,2]
var def
var enemy_order: int = 1
var level_number: int = 1
var inventory: int = 3

var enemy_info = {
	"Alien Robo": {"hp": 15, "atk": [1,2]},
	"Alien Robo DX": {"hp": 30, "atk": [3,6]}
}
