class_name Level extends Node

@export var baseLevel : PackedScene
@export var testFlagLevel : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func changeLevel(level : PackedScene):
	level.instantiate()
	get_tree().change_scene_to_packed(level)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
