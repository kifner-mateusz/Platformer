extends State

func on_enter(player):
	print_debug("State Falling enterd")


func on_physics_process(player, delta: float) -> void:
	player.update_direction()
	player.velocity.y+=player.GRAVITY * delta
	player.move()

	if player.is_on_floor():
		go_to('Idle')
