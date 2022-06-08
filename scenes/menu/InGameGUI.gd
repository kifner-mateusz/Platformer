extends Control


func change_inventory_view(inventory):
	$CanvasLayer/VBoxContainer/HBoxContainer/Label.text=str(inventory['mleko'])



func _ready():
	Global.connect("inventory_update",self,"change_inventory_view")
