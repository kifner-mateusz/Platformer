extends RigidBody2D


#func _integrate_forces(state):
#	var velocity=state.get_linear_velocity()
#	state.set_linear_velocity(Vector2(velocity.x,0))
func _process(delta):
	var collisions=get_colliding_bodies()
	if(collisions.size()<=1):
		return
	var collided_with_player=false
	
	for body in collisions:
		if(body is Player):
			$RayCast2D.cast_to=global_position-body.global_position
			$RayCast2D.force_raycast_update()
			collided_with_player=true
#			print(body.global_position,global_position,global_position-body.global_position)
			if($RayCast2D.is_colliding()):
				var colliding_body=$RayCast2D.get_collider()
				print(colliding_body.name)
				mode=MODE_STATIC
	if(not collided_with_player ):
		mode=MODE_RIGID
