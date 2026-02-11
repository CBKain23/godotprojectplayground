extends Node

@export var baseLevel1 : PackedScene
@export var testFlagLevel : PackedScene

const mainMenu : String = "Main Menu"
const baseLevel : String = "Base Level"
const testLevel : String = "Test Level"

@export_enum(baseLevel, testLevel) var levelSelect : String
var level_dict = {baseLevel : baseLevel, testLevel : testFlagLevel } 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func changeLevel(level : PackedScene):
	level.instantiate()
	get_tree().change_scene_to_packed(level)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
