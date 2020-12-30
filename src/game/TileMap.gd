extends TileMap


const example = [
	[0,0,0,0,0,0],
	[1,1,1,2,3,4],
	[1,1,1,1,1,1],
	[3,3,3,4,5,4],
	[1,1,1,1,1,1],
	[0,0,0,0,0,0],
]


func _ready() -> void:
	pass


func _write_all_cells() -> void:
	var i := 0
	var j := 0
	for row in example:
		j = 0
		for tilenum in row:
			# print("(%d, %d) %d" % [i, j, tilenum])
			set_cell(i, j, tilenum)
			j += 1
		i += 1


func _randomly_write_all_cells() -> void:
	var size := 20 
	for i in range(size):
		for j in range(size):
			set_cell(i, j, rand_range(0,5) )


func _physics_process(delta: float) -> void:
	pass

