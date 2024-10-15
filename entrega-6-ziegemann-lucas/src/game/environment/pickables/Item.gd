extends Node2D

var picked: bool = false


func _on_PickupArea_body_entered(body: Node) -> void:
	if body is Player && !picked:
		body.sum_hp(3)
		hide()
		picked = true
