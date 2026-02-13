extends Node

var baseLevel : PackedScene = preload("uid://bn3d83p6ojjfa")
var testFlagLevel : PackedScene = preload("uid://cxkwojq8evfm3")
var mainMenuScene : PackedScene = preload("uid://bbeabhcoulgha")
var tryAgainMenu : PackedScene = preload("uid://bveatehsyiei4")


enum LevelSelect {BaseLevel, TestLevel, MainMenuLevel, tryAgain}
@export var level : LevelSelect

@export var gameLevel : Dictionary[LevelSelect, PackedScene]

@onready var level_dict : Dictionary[LevelSelect, PackedScene] = {
	LevelSelect.BaseLevel : baseLevel,
	LevelSelect.TestLevel : testFlagLevel,
	LevelSelect.MainMenuLevel : mainMenuScene,
	LevelSelect.tryAgain : tryAgainMenu,
	}

#@export_enum(baseLevel, testLevel, mainMenu) var levelSelect : String


#var level_dict = {mainMenu : mainMenuScene, baseLevel : baseLevel, testLevel : testFlagLevel} 


#var levelSelected : PackedScene = level_dict[levelSelect]



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	

func changeLevel():
	
	get_tree().change_scene_to_packed(gameLevel[level])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
