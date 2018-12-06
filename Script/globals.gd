extends Node

#tile pixel size
const tileSize = Vector2(32,32)

#number of tile per chunk
const chunk_size = Vector2(1000,1000)

# *************************************************************
# ****************** OBJECT ID ********************************
# *************************************************************

const fruit = 0
const root = 1
const root_block = 2

# *************************************************************
# ****************** OBJECT NAME ******************************
# *************************************************************

var Obj_name = {
	0:tr("root fruit"),
	1:tr("roots"),
	2:tr("root block")
	}
	
# *************************************************************
# ****************** OBJECT DESC ******************************
# *************************************************************

var Obj_desc = {
	0:tr("small fruit that grow on a root"),
	1:tr("some roots"),
	2:tr("a block made of roots")
	}
	
# *************************************************************
# ****************** OBJECT ICON ******************************
# *************************************************************

const Obj_icon = {
	0:"res://item_icon/root_berry.png",
	1:"res://item_icon/roots.png",
	2:"res://item_icon/root_block.png"
	}

# *************************************************************
# ****************** OBJECT RECIPE ****************************
# *************************************************************

#first array = list of recipe
#second array = list of component
#third array = item_id and number of component ex: [1,2] -> two roots item

const Obj_recipe = {
	0:null,
	1:null,
	2:[[[1,2]]]
	}

# *************************************************************
# ****************** OBJECT TILE ID ***************************
# *************************************************************

const _fruit_root = 0
const _empty_root = 1

# *************************************************************
# ****************** OBJECT TILE PATH *************************
# *************************************************************

const _Tile_path = {
	0:"res://Scene/fruit_root.tscn",
	1:"res://Scene/empty_root.tscn"
	}

# *************************************************************
# ****************** OBJECT TILE ATTRIBUTE ********************
# *************************************************************

# array of strings describing the attribute of each tile

const _Tile_att = {
	0: null,
	1: null
	}