class_name BulletSpawner
extends Node2D
signal shoot(bullet, direction, location)

var Bullet = preload("res://scenes/bullet.tscn")
var direction : float = 0.0
var speed : float = 50.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += cos(direction) * speed * delta
	position.y += sin(direction) * speed * delta

func _on_timer_timeout() -> void:
	for n in range(8):
		rotation_degrees += 360/8
		shoot.emit(Bullet, rotation, position)
	rotation_degrees += 10


func _on_timer_2_timeout() -> void:
	direction += randf_range(-PI, PI)
	
