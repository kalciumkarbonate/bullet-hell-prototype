class_name Bullet
extends Area2D

@export var speed : float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += sin(rotation) * speed
	position.x += cos(rotation) * speed


func _on_timer_timeout() -> void:
	queue_free()
