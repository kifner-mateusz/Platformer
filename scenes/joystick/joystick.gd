extends CanvasLayer

export var margin_factor = Vector2(0.2,0.1)

func _ready():
	get_viewport().connect("size_changed",self,"on_resize")
	hide()
	yield(get_tree().create_timer(3),"timeout")
	var size = get_viewport().size
	$Controller/AnalogController.scale = Vector2(size.y/720.0,size.y/720.0)


func on_resize():
	var size = get_viewport().size
	$Controller/AnalogController.position = Vector2(size.x * margin_factor.x,size.y - (size.x * margin_factor.y))
	$Controller/AnalogController.scale = Vector2(size.y/720.0,size.y/720.0)
	$Controller/JumpButton.position = Vector2(size.x - (size.x * margin_factor.x),size.y - (size.x * margin_factor.y)- (147*0.7*0.5))

func show():
	on_resize()
	$Controller.show()

func hide():
	$Controller.hide()

