extends Node2D
export onready var player_scene=preload("res://scenes/player/Player.tscn")



func _on_Deathzone_body_entered(body):
	if(body.has_method('death')):
		body.death()
		print(body)

func _ready():
	if(pause_mode!=PAUSE_MODE_STOP):
		var new_player = player_scene.instance()
		$PlayerSpawn.add_child(new_player)
	
