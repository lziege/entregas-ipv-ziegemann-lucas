extends Control

signal retry_selected()
signal return_selected()
onready var options_menu = $OptionsMenu


func _ready() -> void:
	hide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("pause_menu") && !options_menu.visible:
		visible = !visible
		get_tree().paused = visible

func _on_ResumeButton_pressed() -> void:
	hide()
	get_tree().paused = false

func _on_ReturnButton_pressed():
	emit_signal("return_selected")

func _on_RetryButton_pressed():
	get_tree().paused = false
	emit_signal("retry_selected")
