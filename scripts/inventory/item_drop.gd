extends Area2D

var inventory = preload("res://resources/inventory.tres")

var item
onready var sprite = $Sprite

func _ready():
	sprite.texture = item.texture


func _on_ItemDrop_body_entered(_body):
	if inventory.add_item(item):
		queue_free()
