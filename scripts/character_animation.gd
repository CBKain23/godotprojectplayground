class_name Character_Animation extends Node

@export var player : Character

func animation(direction: float, sprite : AnimatedSprite2D, controller : Player_Controller):
	
	if direction == 1:
		sprite.flip_h = false
	elif direction == -1:
		
		sprite.flip_h = true
	
	if player.velocity.x > (controller. MAX_SPEED * 0.01) or player.velocity.x < (-controller.MAX_SPEED * 0.01):
		if player.is_on_floor():
			sprite.play("Walk")
		else:
			sprite.play("Idle")
		
	if player.velocity.y > controller.FALLING_POINT and not player.is_on_floor():
		sprite.play("Fall")
	
	if player.velocity.y < -10 and not player.is_on_floor():
		sprite.play("Jump")
	
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
