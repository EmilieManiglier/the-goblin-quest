extends State

@onready var sprite = $"../../AnimatedSprite2D"
@onready var player = $"../.."

func enter():
	var direction = player.get_attack_direction()
	sprite.flip_h = player.last_facing_direction.x < 0
	sprite.play("attack_" + player.get_attack_direction())
	sprite.frame = 0
	sprite.connect("animation_finished", Callable(self, "_on_attack_finished"), CONNECT_ONE_SHOT)

func _on_attack_finished():
	emit_signal("transitioned", "Idle")
