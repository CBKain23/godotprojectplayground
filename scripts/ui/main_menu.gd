class_name MainMenu extends CanvasLayer

##Reference for the Game Manager
@export var manager : Game_Manager



@export var select : Level.LevelSelect

#The numbers for the date of the build
@export var month : int 
@export var day : int
@export var year : int = 2026

##A reference variable for the BuildDate Label node
@onready var build : Label = %BuildDate


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#Display the build date
	build.text = "Build Date: " + str(month) + "/" + str(day) + "/" + str(year)
	
	#Play the Main Menu Music
	manager.sound.playMusic(manager.sound.MainMenuMusic)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_game_pressed() -> void:
	
	#Stop the Music
	manager.sound.stopMusic()
	
	#Change the scene to the Basic Level
	get_tree().change_scene_to_packed(Level.baseLevel)


func _on_exit_game_pressed() -> void:
	get_tree().quit()


func _on_start_game_button_down() -> void:
	manager.sound.buttonClick()


func _on_exit_game_button_down() -> void:
	manager.sound.buttonClick()


func _on_option_button_down() -> void:
	manager.sound.buttonClick()
