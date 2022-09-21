extends Node

class_name Item
export var item_name : String
export var item_stackable : bool
export var item_count : int
export var item_description : String

enum ITEM_TYPES {TOOL,EQUIPABLE,USABLE,SOLDABLE}
export(ITEM_TYPES) var item_type
export var item_texture : Texture

func Get_item_name():
	return item_name
