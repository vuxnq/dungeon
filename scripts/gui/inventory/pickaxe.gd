extends Item

class_name Pickaxe
func _init():
	item_name = "Pickaxe"
	item_stackable = false
	item_description = "Kopací záležitost"
	item_type = ITEM_TYPES.TOOL
	item_texture = load("res://assets/gui/inventory/pickaxe.png")
