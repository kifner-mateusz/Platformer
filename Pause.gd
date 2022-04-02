extends WindowDialog






func _on_Back_pressed():
	hide()
	get_tree().pasued=false

func _on_Setting_pressed():
	pass

func _on_Exit_pressed():
	get_tree().quit()
	
