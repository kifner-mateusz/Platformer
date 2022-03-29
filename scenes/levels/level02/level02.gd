extends Node2D




func _on_Deathzone_body_entered(body):
	if(body.has_method('death')):
		body.death()
		print(body)

