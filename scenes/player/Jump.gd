extends State

var joystick_jump_active = false

func on_timers_register() -> void:
	register_timer('go_to Falling', 0.1)

func on_enter(player) -> void:
	joystick_jump_active = player.is_joystick_jump_pressed
#	print_debug("State Jump enterd")
	player.get_node("AnimatedSprite").play("Jump")
	player.get_node("AnimatedSprite").speed_scale = 1


func on_input(player, event: InputEvent) -> void:
	if event.is_action_released('jump') or (joystick_jump_active and not(player.is_joystick_jump_pressed)):
		go_to('Falling')


func on_physics_process(player, delta: float) -> void:
	player.update_direction()
	if player.velocity.y > player.DEFAULT_FALL_SPEED:
		player.velocity.y = -player.JUMP_FORCE
	else:
		player.velocity.y += -player.JUMP_FORCE

	player.move()
	player.get_node("AnimatedSprite").speed_scale = smoothstep(10,player.SPEED,abs(player.velocity.x) )
	player.get_node("AnimatedSprite").flip_h = player.velocity.x < 0
	if target.is_on_ceiling():
		go_to('Falling')
