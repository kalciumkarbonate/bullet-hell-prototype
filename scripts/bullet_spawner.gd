class_name BulletSpawner
extends Node2D
signal shoot(bullet, direction, location)

var Bullet = preload("res://scenes/bullet.tscn")
@export var bullet_array_array : Array[BulletArrayData]
@export var array_amount : int = 1

var current_array_index : int = 0
var current_array : BulletArrayData
var a = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_array = bullet_array_array[current_array_index]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if a <= 0:
		for n in range(current_array.array_amount):
			rotation_degrees += current_array.array_coverage/current_array.array_amount
			fire_bullets(current_array.bullet_amount, rotation_degrees, current_array.bullet_coverage, current_array.spawn_distance)
		rotation_degrees += current_array.rotation_per_array
		a = current_array.shot_intermission
	else:
		a -= delta

func fire_bullets(amount, start_direction, angle_coverage, distance):
	start_direction = deg_to_rad(start_direction)
	var fire_rotation = start_direction
	var fire_position : Vector2 = position + Vector2(cos(start_direction) * distance, sin(start_direction) * distance)
	for n in range(amount):
		shoot.emit(Bullet, fire_rotation, fire_position)
		fire_rotation += deg_to_rad(angle_coverage/amount)


	
