extends KinematicBody2D
export var SPEED=1000
export var GRAVITY=400
export var velocity=Vector2.ZERO
export var friction=0.1
export var acceleration=0.25
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
	return velocity
	
