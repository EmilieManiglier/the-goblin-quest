extends CharacterBody2D

var speed = 400
var last_direction: Vector2 = Vector2.RIGHT
var last_move_direction: Vector2 = Vector2.DOWN  
var last_facing_direction: Vector2 = Vector2.RIGHT  

@onready var state_machine = $StateMachine

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction != Vector2.ZERO:
		last_move_direction = direction.normalized()
		if direction.x != 0:
			last_facing_direction.x = direction.x
	velocity = direction * speed
	move_and_slide()


func get_direction_suffix() -> String:
	if abs(last_direction.x) > abs(last_direction.y):
		return "side"
	elif last_direction.y < 0:
		return "up"
	else:
		return "down"

func get_attack_direction() -> String:
	if abs(last_move_direction.x) > abs(last_move_direction.y):
		return "side"
	elif last_move_direction.y < 0:
		return "up"
	else:
		return "down"
