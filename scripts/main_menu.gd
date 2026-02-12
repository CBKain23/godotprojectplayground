class_name MainMenu extends CanvasLayer


@export var manager : Game_Manager
@export var scene : PackedScene

var menu : CanvasLayer

@export var month : int 
@export var day : int
@export var year : int = 2026

@onready var build : Label = %BuildDate


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
	#get_tree().change_scene_to_packed(manager.level.level_dict[manager.level.level])
	#get_tree().change_scene_to_packed(manager.level.level_dict[manager.level])
	
	get_tree().change_scene_to_packed(scene)
	#get_tree().change_scene_to_packed(manager.level.gameLevel[manager.level.level])


func _on_exit_game_pressed() -> void:
	get_tree().quit()
