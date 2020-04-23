extends KinematicBody2D

const ACC = 10
const MAX_SPEED = 100
const FRICTION = 10

var vel = Vector2.ZERO

func _physics_process(delta):
	var input = Vector2.ZERO
	
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input = input.normalized()
	
	if input != Vector2.ZERO:
		vel += input * ACC * delta
		vel = vel.clamped(MAX_SPEED * delta)
	else:
		vel = vel.move_toward(Vector2.ZERO, FRICTION * delta)
		
	move_and_collide(vel)
