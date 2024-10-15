extends Node2D
class_name AbstractWeapon

## Interfaz para un arma usable por el Player.
## Presenta al menos 3 tipos de ataque diferentes, mapeados a
## teclas diferentes, una variable de contenedor de proyectil,
## e interfaces para callbacks regulares.

## Junto al manager de armas se emula el patrón de State Machine,
## siendo esta interfaz un State.

enum ATT_TYPE {
	PRIMARY,
	SECONDARY,
	SPECIAL
}

export (Texture) var weapon_icon: Texture
export (Dictionary) var input_map: Dictionary = {
	"Attack weapon 1": ATT_TYPE.PRIMARY,
	"Attack weapon 2": ATT_TYPE.SECONDARY,
	"Attack weapon 3": ATT_TYPE.SPECIAL
}

var projectile_container: Node


# Por default, enter y exit muestran y esconden el arma.
func enter() -> void:
	show()


func exit() -> void:
	hide()


func update_weapon(delta: float, character, can_attack: bool = true) -> void:
	return
