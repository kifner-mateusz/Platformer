extends Node
enum SHOW_JOYSTICK {
	Always,
	If_Touchscreen,
	Never
}
signal inventory_update(value)
export(Dictionary) var inventory={"mleko":0} setget set_inventory

export(SHOW_JOYSTICK) var show_joystick = SHOW_JOYSTICK.If_Touchscreen

func _ready():
	pass
	
func set_inventory(value):
	inventory=value 
	emit_signal('inventory_update',value)
