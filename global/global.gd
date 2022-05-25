extends Node
enum SHOW_JOYSTICK {
	Always,
	If_Touchscreen,
	Never
}

export(Dictionary) var inventory={"mleko":0}

export(SHOW_JOYSTICK) var show_joystick = SHOW_JOYSTICK.If_Touchscreen

func _ready():
	pass
	
