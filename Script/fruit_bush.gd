extends Area2D

signal add_to_map

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_body_entered(body):
	if(body.get_name() == "player"):
		body.add_new_item(globals.fruit, 1)
		emit_signal("add_to_map", globals._empty_root, self.position)
		queue_free()
	pass # replace with function body
