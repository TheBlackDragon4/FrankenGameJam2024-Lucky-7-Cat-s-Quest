extends Area2D
class_name InteractionArea


@export var action_name: String = "interact"


var interact:Callable = func():
	pass


func _on_body_entered(body: Node2D) -> void:
	body.is_in_group("player")
	InteractionManager.register_area(self)
	print("body entered area")

func _on_body_exited(_body: Node2D) -> void:
	InteractionManager.unregister_area(self)
	print("body left area")
