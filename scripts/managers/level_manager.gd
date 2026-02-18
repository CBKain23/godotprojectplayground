extends Node

##The PackedScene for the Basic Level
var baseLevel : PackedScene = preload("uid://bn3d83p6ojjfa")

##The PackedScene for the Test Flag Level
var testFlagLevel : PackedScene = preload("uid://cxkwojq8evfm3")

##The enumeration for Level Select
enum LevelSelect {BaseLevel, TestLevel}
@export var level : LevelSelect


##The dictionary for the Level
@onready var level_dict : Dictionary[LevelSelect, PackedScene] = {
	LevelSelect.BaseLevel : baseLevel,
	LevelSelect.TestLevel : testFlagLevel,
	}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	

func changeLevel():
	
	get_tree().change_scene_to_packed(Level.baseLevel)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
