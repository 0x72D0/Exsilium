extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var player = get_node("../../../player")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if self.is_visible_in_tree():
		if Input.is_action_just_pressed("inventory_open"):
			self.hide()
			player.menu_open = false
	else:
		if Input.is_action_just_pressed("inventory_open"):
			if !player.menu_open :
				self.show()
				player.menu_open = true