extends Node
var current_level=0
var current_level_name=""
onready var levels= GDSheets.sheet('Maps')
export onready var player_scene=preload("res://scenes/player/Player.tscn")



#
#func go_to_level(level_name):
#	var level_id=0
#	for level in levels.values():
#		if(level["Name"]==level_name):
#			break
#		else:
#			level_id+=1
#
#	go_to_level_by_id(level_id)


func go_to_level_by_id(level_id):
	current_level=level_id
	current_level_name = levels[str(current_level)].Name
	show_joystick()
	var next_level=levels[str(current_level)]
	get_tree().change_scene_to(load(next_level['Path']))
	
	# Czekamy na załadowanie sceny
	while not(get_tree().get_root().has_node(current_level_name)):
		yield(get_tree(),"idle_frame")
	# Dodajemy Gracza
	var new_player = player_scene.instance()
	get_tree().get_root().get_node(current_level_name).get_node("PlayerSpawn").add_child(new_player)
	


func next():
	go_to_level_by_id(current_level+1)
	
	
	

func reset():
	show_joystick()
	var next_level=levels[str(current_level)]
	get_tree().change_scene_to(load(next_level['Path']))
	
func show_joystick():
	if (current_level !=0):
		match Global.show_joystick:
			Global.SHOW_JOYSTICK.Always:
				Joystick.show()
			Global.SHOW_JOYSTICK.If_Touchscreen:
				if  OS.has_touchscreen_ui_hint():
					Joystick.show()
			Global.SHOW_JOYSTICK.Never:
				Joystick.hide()
	else:
		Joystick.hide()
