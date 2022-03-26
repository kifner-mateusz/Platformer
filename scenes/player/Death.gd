extends State

func on_timers_register() -> void:
	pass


func on_ready() -> void:
	pass


func on_enter(player) -> void:
	player.get_node('AnimatedSprite').modulate=Color(1,0,0)
	player.rotation_degrees=90

func on_exit(player) -> void:
	pass


func on_input(player, event: InputEvent) -> void:
	pass


func on_process(player, delta: float) -> void:
	pass


func on_physics_process(player, delta: float) -> void:
	pass
