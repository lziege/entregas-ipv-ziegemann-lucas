extends AbstractStateMachine


 
func _on_DetectionArea_body_entered(body) -> void:
	current_state.handle_event("body_entered", body)


func _on_DetectionArea_body_exited(body) -> void:
	current_state.handle_event("body_exited", body)


func _on_Body_animation_finished() -> void:
	_on_animation_finished(character.get_current_animation())


func notify_hit(amount: int) -> void:
	if current_state != $Die:
		_change_state("die")
