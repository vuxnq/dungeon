extends Node

var player_position : Vector2
var player_inventory : Array

func _ready():
	var pick = load("res://scripts/gui/inventory/pickaxe.gd").new()
	player_inventory.append(pick)
