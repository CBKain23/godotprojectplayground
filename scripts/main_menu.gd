class_name MainMenu extends CanvasLayer


@export var manager : Game_Manager
@export var scene : PackedScene

@export var month : int 
@export var day : int
@export var year : int = 2026

@onready var build : Label = %BuildDate
@onready var level : Level

const mainMenu : String = "Main Menu"
const baseLevel : String = "Base Level"
const testLevel : String = "Test Level"

@export_enum(baseLevel, testLevel) var levelSelect : String
#var level_dict = {baseLevel : level.baseLevel, testLevel : level.testFlagLevel } 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scene.instantiate()
	
	build.text = "Build Date: " + str(month) + "/" + str(day) + "/" + str(year)
	
	manager.sound.playMusic(manager.sound.MainMenuMusic)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_game_pressed() -> void:
	
	manager.sound.stopMusic()
	get_tree().change_scene_to_packed(scene)


func _on_exit_game_pressed() -> void:
	get_tree().quit()
