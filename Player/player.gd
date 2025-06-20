extends CharacterBody2D

var speed = 400  # move speed in pixels/sec
var rotation_speed = 1.5  # turning speed in radians/sec

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Input.get_vector('left', 'right', 'up', 'down')
	velocity = direction * speed
	
	if Input.is_action_pressed('right'):
		animated_sprite.play('run')
		animated_sprite.flip_h = direction.x < 0
	elif Input.is_action_pressed('left'):
		animated_sprite.play('run')
		animated_sprite.flip_h = true
	else:
		animated_sprite.play('idle')
	
	move_and_slide()

func _unhandled_input(event):
	if Input.is_action_just_pressed('attack'):
		animated_sprite.play('attack_side')
