extends Control

# DOCS

# HyperLog https://github.com/GuyUnger/HyperLog
# Godot Sheets https://github.com/peterhoglund/gd-sheets
# Godot SFXR https://github.com/tomeyro/godot-sfxr


func _ready():
	var Maps = GDSheets.sheet("Maps")
	print(Maps["1"])
