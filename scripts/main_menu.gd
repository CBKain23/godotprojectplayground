class_name MainMenu extends CanvasLayer


@export var manager : Game_Manager
@export var scene : PackedScene

@export var month : int 
@export var day : int
@export var year : int = 2026

@onready var build : Label = %BuildDate

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scene.instantiate()
	
	build.text = "Build Date: " + str(month) + "/" + str(day) + "/" + str(year)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_game_pressed() -> void:
	
	get_tree().change_scene_to_packed(scene)


func _on_exit_game_pressed() -> void:
	get_tree().quit()
