extends WindowDialog




func _ready():
	if Engine.editor_hint:
		show()
	for level in Levelmanager.levels.values():
		print(level)
		var new_button=Button.new()
		new_button.text=level["Name"]
		$GridContainer.add_child(new_button)
