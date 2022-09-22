extends Area2D
var item_drop = preload("res://scenes/gui/inventory/item_drop.tscn")
var drop = preload("res://resources/diamond.tres") # actual drop (like diamonds)


func _on_DropArea_body_entered(_body):
	drop_item(drop)

func drop_item(drop):
	var item_drop_instance = item_drop.instance()
	item_drop_instance.item = drop
	item_drop_instance.position = position
	get_parent().call_deferred("add_child", item_drop_instance)
