extends State

@onready var sprite = $"../../AnimatedSprite2D"
@onready var player = $"../.."

func enter():
	sprite.flip_h = player.last_facing_direction.x < 0
	sprite.play("idle")

func physics_update(_delta):
	if Input.is_action_pressed("attack"):
		emit_signal("transitioned", "Attack")
	elif Input.get_vector("left", "right", "up", "down") != Vector2.ZERO:
		emit_signal("transitioned", "Run")
