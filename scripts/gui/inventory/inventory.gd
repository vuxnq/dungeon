extends Node

func _ready():
	for i in range(len(Global.player_inventory)):
		print(Global.player_inventory[i].Get_item_name())
		get_node("GridContainer/Slot1").text
