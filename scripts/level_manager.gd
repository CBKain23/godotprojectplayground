extends Node

@export var baseLevel : PackedScene
@export var testFlagLevel : PackedScene
@export var mainMenuScene : PackedScene


enum LevelSelect {BaseLevel, TestLevel, MainMenuLevel}
@export var level : LevelSelect

@export var dict : Dictionary

@onready var level_dict : Dictionary[LevelSelect, PackedScene] = {
	LevelSelect.BaseLevel : baseLevel,
	LevelSelect.TestLevel : testFlagLevel,
	LevelSelect.MainMenuLevel : mainMenuScene,
	
	}

#@export_enum(baseLevel, testLevel, mainMenu) var levelSelect : String


#var level_dict = {mainMenu : mainMenuScene, baseLevel : baseLevel, testLevel : testFlagLevel} 


#var levelSelected : PackedScene = level_dict[levelSelect]



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	

func changeLevel():
	
	var scene = level_dict.get(level)
	get_tree().change_scene_to_packed(baseLevel)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
