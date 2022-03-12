extends Control


func _ready():
	var Maps = GDSheets.sheet("Maps")
	#print(Maps["1"])


func _on_Start_pressed():
	Levelmanager.next()


func _on_Quit_pressed():
	get_tree().quit()


func _on_Settings_pressed():
	$Settings.popup_centered()
