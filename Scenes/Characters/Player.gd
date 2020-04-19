extends KinematicBody2D

var vel = Vector2.ZERO

func _physics_process(delta):
	var input = Vector2.ZERO
	
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if input != Vector2.ZERO:
		vel = input
	else:
		vel = Vector2.ZERO
		
	move_and_collide(vel)
