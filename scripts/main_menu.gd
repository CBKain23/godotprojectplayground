class_name MainMenu extends CanvasLayer


@export var manager : Game_Manager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_game_pressed() -> void:
	
	manager.level.changeLevel(manager.level.baseLevel)
