extends Area2D


func _on_Mleko_body_entered(body):
	if(body.has_method('collect')):
		body.collect('mleko',1)
		
		collision_layer=0
		queue_free()
