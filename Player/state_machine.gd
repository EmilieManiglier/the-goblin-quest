extends Node
class_name StateMachine

var current_state: State

func _ready():
	change_state("Idle")

func change_state(state_name: String):
	if current_state:
		current_state.exit()
		current_state.disconnect("transitioned", Callable(self, "_on_state_transitioned"))
	
	current_state = get_node(state_name)
	current_state.enter()
	current_state.connect("transitioned", Callable(self, "_on_state_transitioned"))

func _on_state_transitioned(next_state: String):
	change_state(next_state)

func _process(delta):
	if current_state:
		current_state.update(delta)

func _physics_process(delta):
	if current_state:
		current_state.physics_update(delta)
