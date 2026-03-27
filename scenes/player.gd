extends CharacterBody2D

@export var speed : float = 1.0
@export var max_health : float = 1.0
var health

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = Input.get_vector("left", "right", "up", "down") * speed
	move_and_slide()
	DebugDraw2D.set_text("Health", health)
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Bullet:
		health -= 1
