extends AbstractState

onready var dash_timer = $DashTimer


func enter() -> void:
	character.velocity.x = character.body_pivot.scale.x * character.dash_speed
	character._play_animation("walk")
	dash_timer.start()


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") && character.is_on_floor():
		emit_signal("finished", "jump")


func update(delta: float) -> void:
	character._handle_weapon_actions()
	character._apply_movement()


func handle_event(event: String, value = null) -> void:
	match event:
		"hit":
			character._handle_hit(value)
			if character.dead:
				emit_signal("finished", "dead")


func _on_DashTimer_timeout():
	if character.is_on_floor():
		if character.move_direction == 0:
			emit_signal("finished", "idle")
		else:
			emit_signal("finished", "walk")

