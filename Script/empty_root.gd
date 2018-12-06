extends Area2D

signal return_interaction

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var progression = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _on_interact():
	progression += 20
	if(progression >= 100):
		emit_signal("return_interaction", progression, globals.root, 1)
		queue_free()
	emit_signal("return_interaction", progression)

func _on_body_entered(body):
	if body.get_name() == "player" :
		body.connect("interact_signal", self, "_on_interact")
		self.connect("return_interaction", body, "_return_interaction")

func _on_body_exited(body):
	if body.get_name() == "player" :
		body.disconnect("interact_signal", self, "_on_interact")
		self.disconnect("return_interaction", body, "_return_interaction")