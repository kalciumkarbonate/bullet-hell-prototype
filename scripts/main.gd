extends Node

func _process(delta: float) -> void:
	DebugDraw2D.set_text("FPS", Engine.get_frames_per_second())

func _on_bullet_spawner_shoot(bullet: Variant, direction: Variant, location: Variant) -> void:
	var spawned_bullet = bullet.instantiate()
	add_child(spawned_bullet)
	spawned_bullet.rotation = direction
	spawned_bullet.position = location
