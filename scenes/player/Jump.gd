extends State

func on_timers_register() -> void:
	register_timer('go_to Falling', 0.1)

func on_enter(player) -> void:
	print_debug("State Jump enterd")
	player.get_node("AnimatedSprite").play("Jump")
	player.get_node("AnimatedSprite").speed_scale = 1


func on_input(player, event: InputEvent) -> void:
	if event.is_action_released('jump'):
		go_to('Falling')


func on_physics_process(player, delta: float) -> void:
	player.update_direction()
	if player.velocity.y > player.DEFAULT_FALL_SPEED:
		player.velocity.y = -player.JUMP_FORCE
	else:
		player.velocity.y += -player.JUMP_FORCE

	player.move()
	if target.is_on_ceiling():
		go_to('Falling')
