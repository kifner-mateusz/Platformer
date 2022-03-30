extends KinematicBody2D
class_name Player

const SPEED := 100
const JUMP_FORCE := 60
const GRAVITY := 600
const DEFAULT_FALL_SPEED := 0.1
const FRICTION := 0.1
const ACCELERATION := 0.25

var direction: float = 0
var velocity := Vector2.ZERO

func update_direction() -> void:
	direction = Input.get_axis("left","right")





func move():
	if(direction==0):
		velocity.x=lerp(velocity.x,0,FRICTION)
	else:
		velocity.x=lerp(velocity.x,direction*SPEED,ACCELERATION)

	velocity=move_and_slide(velocity,Vector2.UP)
	
