extends RichTextLabel

# class member variables go here, for example:
# var a = 2

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Inventory_item_activated(index):
	var desc = globals.Obj_desc[get_node("../Inventory").get_item_metadata(index)[0]]
	self.clear()
	self.add_text(desc)
	pass # replace with function body
