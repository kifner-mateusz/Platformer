extends WindowDialog


export(NodePath) onready var buttons = get_node(buttons) as GridContainer

func _ready():
	if Engine.editor_hint:
		show()
	for level in Levelmanager.levels.values():
		print(level)
		var new_button=Button.new()
		new_button.text=level["Name"]
		buttons.add_child(new_button)
