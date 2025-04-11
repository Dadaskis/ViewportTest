extends Node

const MODEL_PATH = "res://models/"
const RENDERS_PATH = "res://renders/"

onready var viewport = $Viewport
onready var camera = $Viewport/Camera

func list_files(path) -> Array:
	var file_list = []
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while (file_name != ""):
			if not dir.current_is_dir():
				file_list.append(file_name)
			file_name = dir.get_next()
	else:
		print("list_files: An error occurred when trying to access the path.")
		print(path)
	file_list.erase(".")
	file_list.erase("..")
	return file_list

# Called when the node enters the scene tree for the first time.
func _ready():
	var model_files = list_files(MODEL_PATH)
	for model_file in model_files:
		print("Processing: " + model_file)
		if not ".glb.import" in model_file:
			continue
		print("Correct: " + model_file)
		var file_name = model_file.replace(".import", "")
		var model_name = file_name.replace(".glb", "")
		var full_path = MODEL_PATH + file_name
		var scene = load(full_path)
		if not scene:
			print("Scene does not exist")
			continue
		var model_node = scene.instance()
		if not is_instance_valid(model_node):
			continue
		var model = model_node.get_child(0) as MeshInstance
		if not is_instance_valid(model):
			continue
		model_node.remove_child(model)
		model_node.queue_free()
		viewport.add_child(model)
		model.position = Vector3.ZERO
		var aabb = model.get_aabb()
		var offset = aabb.size
		offset.y *= 0.5
		camera.position = aabb.get_center() + offset
		camera.look_at(aabb.get_center(), Vector3(0.0, 0.999, 0.0))
		yield(VisualServer, "frame_post_draw")
		yield(VisualServer, "frame_post_draw")
		var texture: = viewport.get_texture() as ViewportTexture
		var image: = texture.get_data() as Image
		image.save_png(RENDERS_PATH + model_name + ".png")
		model.queue_free()
		print("Rendering: " + model_name)
