extends RichTextLabel

# class member variables go here, for example:
# var a = 2
onready var crafting_list = get_node("../Crafting")
var feedback_instance = false

func _show_description(index):
	var recipe_list = globals.Obj_recipe[crafting_list.get_item_metadata(index)]
	self.clear()
	for recipe in recipe_list:
		for component in recipe:
			add_text(globals.Obj_name[component[0]] + " -> " + str(component[1]) + "\n")

func _give_feedback(text):
	if !feedback_instance:
		self.feedback_instance = true
		var text_save = self.text
		self.clear()
		self.add_text(text)
		yield(get_tree().create_timer(1.0),"timeout")
		if(self.text == text):
			self.clear()
			self.add_text(text_save)
		self.feedback_instance = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
