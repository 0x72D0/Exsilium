extends ItemList

func verify_item(item_id, count):
	for index in range(self.get_item_count()):
		if(self.get_item_metadata(index)[0] == item_id):
			var present_num = self.get_item_metadata(index)[1]
			if present_num >= count:
				return true
	return false

func destroy_item(item_id, count):
	for index in range(self.get_item_count()):
		if(self.get_item_metadata(index)[0] == item_id):
			var present_num = self.get_item_metadata(index)[1]
			if(present_num == count):
				self.remove_item(index)
				return
			if(present_num > count):
				self.set_item_metadata(index, [item_id, present_num - count])
				self.set_item_text(index, globals.Obj_name[item_id] + " [" + str(present_num-count) + "]")
				return
	pass

func add_new_item(item_id, count):
	#check if the object already exist
	for index in range(self.get_item_count()):
		if(self.get_item_metadata(index)[0] == item_id):
			var present_num = self.get_item_metadata(index)[1]
			self.set_item_metadata(index, [item_id, present_num + count])
			self.set_item_text(index, globals.Obj_name[item_id] + " [" + str(present_num+count) + "]")
			return
	#add the object
	self.add_item(globals.Obj_name[item_id] + " [" + str(count) + "]",load(globals.Obj_icon[item_id]))
	self.set_item_metadata(self.get_item_count()-1, [item_id, count])
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
