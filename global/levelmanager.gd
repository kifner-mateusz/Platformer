extends Node
var current_level=0
var current_level_name=""
onready var levels= GDSheets.sheet('Maps')





func next():
	current_level+=1
	var next_level=levels[str(current_level)]
	get_tree().change_scene_to(load(next_level['Path']))
	
	
	
#func _ready():
#	print(levels)
func reset():
	var next_level=levels[str(current_level)]
	get_tree().change_scene_to(load(next_level['Path']))
	
