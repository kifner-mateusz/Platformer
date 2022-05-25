extends Control


func _process(delta):
	$VBoxContainer/HBoxContainer/Label.text=str(Global.inventory['mleko'])
