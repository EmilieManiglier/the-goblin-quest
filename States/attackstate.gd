extends State

@onready var sprite = $"../../AnimatedSprite2D"
@onready var player = $"../.."
@onready var hurt_box : HurtBox = $"../../Interactions/HurtBox"

func enter():
	var direction = player.get_attack_direction()
	sprite.flip_h = player.last_facing_direction.x < 0
	sprite.play("attack_" + direction)
	sprite.frame = 0
	sprite.connect("animation_finished", Callable(self, "_on_attack_finished"), CONNECT_ONE_SHOT)
	hurt_box.monitoring = false

func _physics_process(delta):
	# Active la hurtbox à partir de la 2e frame
	if sprite.frame >= 4 and sprite.animation != "idle" and sprite.animation != "run":
		hurt_box.monitoring = true

func _on_attack_finished():
	emit_signal("transitioned", "Idle")
	hurt_box.monitoring = false
