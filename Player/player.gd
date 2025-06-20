extends CharacterBody2D

var speed = 400  # move speed in pixels/sec
var rotation_speed = 1.5  # turning speed in radians/sec
var is_attacking = false
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Input.get_vector('left', 'right', 'up', 'down')
	velocity = direction * speed
	
	if Input.is_action_pressed('right') || Input.is_action_pressed('left') || Input.is_action_pressed('down') || Input.is_action_pressed('up'):
		animated_sprite.play('run')
		animated_sprite.flip_h = direction.x < 0
	elif Input.is_action_pressed('attack'):
		is_attacking = true
		animated_sprite.play('attack_side')
	elif not is_attacking:
		animated_sprite.play('idle')
	
	move_and_slide()
 
