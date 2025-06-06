extends Area2D

##################################################
func _ready() -> void:
	self.connect("body_entered", Callable(self, "_on_body_entered"))

##################################################
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Knight"):
		SB.coin_collected(100)
		queue_free()
