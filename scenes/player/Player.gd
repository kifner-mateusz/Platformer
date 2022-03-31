extends KinematicBody2D
class_name Player
signal death
const SPEED := 300
const JUMP_FORCE := 60
const GRAVITY := 1000
const DEFAULT_FALL_SPEED := 0.1
const FRICTION := 0.1
const ACCELERATION := 0.25


var is_joystick_pressed = false
var is_joystick_jump_pressed = false
var joystick_direction:float = 0
var direction: float = 0
var velocity := Vector2.ZERO

func _ready():
	Joystick.get_node("Controller/AnalogController").connect("analogChange",self,"update_direction_joystick")
	Joystick.get_node("Controller/AnalogController").connect("analogPressed",self,"update_direction_joystick_pressed")
	Joystick.get_node("Controller/AnalogController").connect("analogRelease",self,"update_direction_joystick_released")
	Joystick.get_node("Controller/JumpButton").connect("pressed",self,"joystick_jump_pressed")
	Joystick.get_node("Controller/JumpButton").connect("released",self,"joystick_jump_released")


func update_direction() -> void:
	if is_joystick_pressed:
		direction = joystick_direction
	else:
		direction = Input.get_axis("left","right")

func update_direction_joystick(dir, dir_str):
	joystick_direction = dir.x

func update_direction_joystick_pressed():
	is_joystick_pressed = true

func update_direction_joystick_released():
	is_joystick_pressed = false
	
func joystick_jump_pressed():
	is_joystick_jump_pressed = true
	
func joystick_jump_released():
	is_joystick_jump_pressed = false
	

func move():
	if(direction==0):
		velocity.x=lerp(velocity.x,0,FRICTION)
	else:
		velocity.x=lerp(velocity.x,direction*SPEED,ACCELERATION)

	velocity=move_and_slide(velocity,Vector2.UP)
	
func death():
	$FSM.go_to('Death')
	emit_signal("death")
