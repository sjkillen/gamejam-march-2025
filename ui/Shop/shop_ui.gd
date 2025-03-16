extends Node2D


func _ready() -> void:
	Globals.query_shop_open.connect(query_shop_open)

func query_shop_open(fn):
	fn.call()
