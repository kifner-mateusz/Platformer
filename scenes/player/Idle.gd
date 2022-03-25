extends State

func on_enter(player) -> void:
	print_debug("State Idle enterd")
	player.get_node("AnimatedSprite").play("Walk")
	

func on_input(player, event: InputEvent) -> void:
	if(event.is_action_pressed("jump")):
		go_to("Jump")


func on_physics_process(player, delta: float) -> void:
	player.update_direction()
	player.velocity.y+=player.GRAVITY * delta
	if (player.direction != 0):
		go_to("Walk")
	elif not player.is_on_floor():
		go_to('Falling')
		
	player.move()
