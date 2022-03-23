extends State



func on_timers_register() -> void:
	pass


func on_ready() -> void:
	pass


# NOTE: leaving 'player' not typed to avoid errors when
#		using typing in the extended scripts
func on_enter(player) -> void:
	print(player)

func on_exit(player) -> void:
	pass


func on_input(player, event: InputEvent) -> void:
	pass


func on_process(player, delta: float) -> void:
	player._on_input()

	
	if(Input.is_action_just_pressed("jump")and player.is_on_floor()):
		player.velocity.y= player.jump_speed
		player.velocity=player.move_and_slide(player.velocity,Vector2.UP)
		go_to("Jump")
		
	player.velocity=player.move_and_slide(player.velocity,Vector2.UP)
func on_physics_process(player, delta: float) -> void:
	pass
	

