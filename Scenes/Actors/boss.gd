extends Enemy

var health = 20


func _ready() -> void:
	super._ready()
	$Sprite/AnimateSprite.play()


func _on_hit_area_body_entered(body: Node2D) -> void:
	if alive and body.is_in_group("Traps"):
		take_damage(1)

	elif alive and body.is_in_group("Bullet"):
		take_damage(1)
		body.queue_free()


func take_damage(amount: int) -> void:
	if alive:
		health -= amount
		print("Boss Health: ", health)

		if health <= 0:
			GameManager.add_score()
			death_tween()
