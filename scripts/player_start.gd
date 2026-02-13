class_name Player_Start extends Node2D

@onready var game_manager = Game_Manager.new()
@onready var spawn : Marker2D = %SpawnLocation
@export var player = preload("uid://1g074344nc3p")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.instantiate()
	spawn_player()



func spawn_player():
	$Sprite.visible = false
	
	player.global_position = spawn.global_position
	
	add_child(player)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
