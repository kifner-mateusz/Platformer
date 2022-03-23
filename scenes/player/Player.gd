extends KinematicBody2D
export var SPEED=500
export var GRAVITY=100
export var velocity=Vector2.ZERO
export var friction=0.1
export var acceleration=0.25
export var jump_speed=-3000
func _on_input():
	var direction=0
	if(Input.is_action_pressed("right")):
		direction+=1
	if(Input.is_action_pressed("left")):
		direction-=1
#	velocity.y+=GRAVITY*delta
#	velocity=move_and_slide(velocity,Vector2.UP)
	if(direction==0):
		velocity.x=lerp(velocity.x,0,friction)
	else:
		velocity.x=lerp(velocity.x,direction*SPEED,acceleration)

	if not(get_node("FloorDetector").is_colliding()):
		print("niekoliduje")
		velocity.y=GRAVITY*5
	
	else:
		print('koliduje')
		velocity.y=GRAVITY
	
	
	return velocity
	
	
	
