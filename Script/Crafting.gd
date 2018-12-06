extends ItemList

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

signal give_feedback

onready var player = get_node("../../../../player")

func _ready():
	self.add_item(globals.Obj_name[2], load(globals.Obj_icon[2]))
	self.set_item_metadata(0, 2)
	self.connect("item_selected", get_node("../Crafting_recipe"), "_show_description")
	self.connect("give_feedback",get_node("../Crafting_recipe"),"_give_feedback")
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Crafting_item_activated(index):
	var item_id = self.get_item_metadata(index)
	var recipe_list = globals.Obj_recipe[item_id]
	var component_to_destroy
	#verify if the player posess all the component
	for recipe in recipe_list:
		var verify_ok = true
		for component in recipe:
			verify_ok = verify_ok and player.verify_item(component[0],component[1])
		if verify_ok:
			#if the player have all the component destroy and create the result
			for component in recipe:
				player.destroy_item(component[0],component[1])
			player.add_new_item(item_id, 1)
			emit_signal("give_feedback", tr("craft succeed"))
			return
	emit_signal("give_feedback", tr("you don't have the required components"))