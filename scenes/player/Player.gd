extends KinematicBody2D
#class_name Player

const SPEED := 100
const JUMP_FORCE := 60
const GRAVITY := 600
const DEFAULT_FALL_SPEED := 0.1
const FRICTION := 0.1
const ACCELERATION := 0.25

var direction: int = 0
var velocity := Vector2.ZERO

func update_direction() -> void:
	direction = 0

	if Input.is_action_pressed('right'):
		direction += 1

	if Input.is_action_pressed('left'):
		direction -= 1


#func _on_input(delta):
#
#	if direction:
#		($AnimatedSprite as AnimatedSprite).flip_h = direction < 0
##	velocity.y+=GRAVITY*delta
##	velocity=move_and_slide(velocity,Vector2.UP)
#
#	if(Input.is_action_just_pressed("jump")):
#		if velocity.y > DEFAULT_FALL_SPEED:
#			velocity.y = -JUMP_FORCE
#		else:
#			velocity.y += -JUMP_FORCE
#
#	if is_on_floor() or is_on_ceiling():
#		velocity.y = DEFAULT_FALL_SPEED
#	velocity.y +=  delta * GRAVITY
##	if velocity.y > DEFAULT_FALL_SPEED:
##		velocity.y = -JUMP_FORCE
##	else:
##		velocity.y += -JUMP_FORCE
##
#	
#
#
#
#
#	move_and_slide(velocity, Vector2.UP)

#	if not(get_node("FloorDetector").is_colliding()):
#		print("niekoliduje")
#		velocity.y=GRAVITY*5
#
#	else:
#		print('koliduje')
#		velocity.y=GRAVITY
	
	
#	return velocity
	
func move():
	if(direction==0):
		velocity.x=lerp(velocity.x,0,FRICTION)
	else:
		velocity.x=lerp(velocity.x,direction*SPEED,ACCELERATION)

	velocity=move_and_slide(velocity,Vector2.UP)
	
