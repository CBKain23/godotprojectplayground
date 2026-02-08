class_name Player_Start extends Node2D

@onready var game_manager = Game_Manager.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$Sprite.visible = false
	#
	#character.global_position = $".".global_position
	#
	#add_child(character)
	pass
	game_manager.getPlayerStart(self)



func spawn_player(character: Character):
	$Sprite.visible = false
	
	character.global_position = $".".global_position
	
	add_child(character)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
