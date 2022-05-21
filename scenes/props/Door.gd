extends Area2D

var player_class = preload("res://scenes/player/Player.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _on_Door_body_entered(body):
	if body is player_class:
		Levelmanager.next()
