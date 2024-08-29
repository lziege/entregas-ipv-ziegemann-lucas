extends Sprite

onready var cannon:Sprite = $Cannon

var speed = 200
var projectile_container:Node

func set_projectile_container(container:Node):
	cannon.projectile_container = container
	projectile_container = container

func _physics_process(delta):
	var direction = int(Input.is_action_pressed("mover_der")) - int(Input.is_action_pressed("mover_izq"))
	var mouse_position:Vector2 = get_global_mouse_position()
	cannon.look_at(mouse_position)
	if Input.is_action_just_pressed("fire"):
		cannon.fire()
	position.x += direction * speed * delta
