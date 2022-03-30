extends State

func on_enter(player):
	player.get_node("AnimatedSprite").play("Jump")
	player.get_node("AnimatedSprite").speed_scale = 1
#	print_debug("State Falling enterd")


func on_physics_process(player, delta: float) -> void:
	player.update_direction()
	player.velocity.y+=player.GRAVITY * delta
	player.move()
	player.get_node("AnimatedSprite").speed_scale = smoothstep(10,player.SPEED,abs(player.velocity.x) )
	player.get_node("AnimatedSprite").flip_h = player.velocity.x < 0
	if player.is_on_floor():
		go_to('Idle')
