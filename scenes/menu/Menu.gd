extends Control


func _ready():
	var Maps = GDSheets.sheet("Maps")
	#print(Maps["1"])


func _on_Start_pressed():
	Levelmanager.next()
