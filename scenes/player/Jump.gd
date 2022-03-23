extends State


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func on_timers_register() -> void:
	pass


func on_ready() -> void:
	pass


# NOTE: leaving 'player' not typed to avoid errors when
#		using typing in the extended scripts
func on_enter(player) -> void:
	pass


func on_exit(player) -> void:
	pass


func on_input(player, event: InputEvent) -> void:
	pass


func on_process(player, delta: float) -> void:
	player._on_input()
	if(player.is_on_floor()):
		go_to("Idle")
		
	player.velocity=player.move_and_slide(player.velocity,Vector2.UP)

func on_physics_process(player, delta: float) -> void:
	pass
