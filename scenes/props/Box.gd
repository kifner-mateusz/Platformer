extends KinematicBody2D

const GRAVITY = 1000
const SPEED = 200

func _physics_process(delta):
	var velocity = Vector2(0,GRAVITY)
	var rayCollL = $Left.is_colliding()
	if (rayCollL):
		var rayCollBody = $Left.get_collider()
		if (rayCollBody is Player and rayCollBody.direction == 1):
			velocity.x += SPEED
	
	rayCollL = $Right.is_colliding()
	if (rayCollL):
		var rayCollBody = $Right.get_collider()
		if (rayCollBody is Player and rayCollBody.direction == -1):
			velocity.x += - SPEED
	
	move_and_slide(velocity,Vector2.UP)
	
	


#
#var collided_with_player=false
##func _integrate_forces(state):
##	var velocity=state.get_linear_velocity()
##	state.set_linear_velocity(Vector2(velocity.x,0))
#func _physics_process(delta):
#	var collisions=get_colliding_bodies()
#	if(collisions.size()<=1 and not collided_with_player):
#		return
#	print(collisions)
#	mode=MODE_CHARACTER
#	collided_with_player=false
#	for body in collisions:
#		if(body is Player):
#			$RayCast2D.enabled=true
#			$RayCast2D.cast_to=global_position-body.global_position
#			$RayCast2D/Sprite.position=global_position-body.global_position
#			$RayCast2D.force_raycast_update()
#			collided_with_player=true
#
##			print(body.global_position,global_position,global_position-body.global_position)
#			if($RayCast2D.is_colliding()):
#				var colliding_body=$RayCast2D.get_collider()
#				#print(colliding_body.name,collided_with_player)
#				mode=MODE_STATIC
#
#
#			$RayCast2D.enabled=true
##	if(not collided_with_player):
#
#	#	print("e",collided_with_player)
