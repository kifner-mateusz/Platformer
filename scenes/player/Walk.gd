extends State

var falling_timer: String = ''

func on_timers_register() -> void:
	falling_timer = register_timer('go_to Falling', 0.2)


func on_enter(player) -> void:
#	print_debug("State Walk enterd")
	player.get_node("AnimatedSprite").play("Walk")

func on_input(player, event: InputEvent) -> void:
	if(event.is_action_pressed("jump")):
		go_to("Jump")


func on_physics_process(player, delta: float) -> void:
	player.update_direction()
	player.velocity.y+=player.GRAVITY * delta
	if(Input.is_action_just_pressed("jump")):
		go_to("Jump")
	player.move()
	
	if player.is_on_floor():
		reset_timer(falling_timer)

	if (abs(player.velocity.x) < 10):
		go_to("Idle")
	else:
		player.get_node("AnimatedSprite").speed_scale = smoothstep(10,player.SPEED,abs(player.velocity.x) )
		player.get_node("AnimatedSprite").flip_h = player.velocity.x < 0
	
