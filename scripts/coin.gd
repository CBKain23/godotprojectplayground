class_name Coin extends Area2D

@export var value : int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func pickUp(manager : Game_Manager):
	manager.points.addPoints(value)
	manager.sound.playSFX(manager.sound.coin)
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	
	if area.get_collision_layer_value(7) == true:
		
		pickUp(area.get_parent().game_manager)
		
	
