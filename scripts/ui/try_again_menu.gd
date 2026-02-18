extends CanvasLayer

@export var scene : PackedScene
@export var manager : Game_Manager

@export var level : Level.LevelSelect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Return the main menu
func _on_yes_pressed() -> void:
	get_tree().change_scene_to_packed(Level.mainMenuScene)


#Quit the game
func _on_no_pressed() -> void:
	get_tree().quit()

#Play the button click SFX
func _on_yes_button_down() -> void:
	manager.sound.buttonClick()

#Play the button click SFX
func _on_no_button_down() -> void:
	manager.sound.buttonClick()
	
