extends State

@onready var sprite = $"../../AnimatedSprite2D"
@onready var player = $"../.."

func enter():
	sprite.flip_h = player.last_direction.x < 0
	sprite.play("run")

func physics_update(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	sprite.flip_h = direction.x < 0

	if direction == Vector2.ZERO:
		emit_signal("transitioned", "Idle")
	elif Input.is_action_pressed("attack"):
		emit_signal("transitioned", "Attack")
