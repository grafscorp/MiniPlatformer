extends Node

@export var sound : AudioStreamPlayer

enum {
	GAME_MODE,
	MENU_MODE
}

var mode = MENU_MODE
var currect_level : int = 1

const SKINS := [
	"dude",
	"vr",
	"pink",
	"ninja"
]

var PlayerSkin = "dude"
var MAX_HEAL = 3
func sndplay()->void:
	sound.play()

signal hitPlayer()
signal PlayerDie()
signal focusBTN()
signal Win()
