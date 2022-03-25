tool
extends Node2D

export(bool) var generate_collisions = false setget _generate

export var tex_size = Vector2(32,32)

func _generate(val):
	if Engine.editor_hint and val:
		for i in range(get_child_count()):
			var new_static_body = StaticBody2D.new()
			var new_collision = CollisionShape2D.new()
			new_collision.shape = RectangleShape2D.new()
			new_collision.shape.extents = tex_size/2
			for a in get_child(i).get_children():
				a.free()
			get_child(i).add_child(new_static_body)
			new_static_body.add_child(new_collision)
			new_static_body.set_owner(get_tree().get_edited_scene_root())
			new_collision.set_owner(get_tree().get_edited_scene_root())
