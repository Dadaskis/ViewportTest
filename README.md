# ViewportTest - Godot 3D Viewport Rendering Experiment

A simple Godot project demonstrating 3D model rendering using Viewport nodes. This project was created to experiment with rendering 3D models to textures and capturing them as 2D images within the Godot engine.

*This project was made as an example for my friend Bender.*

## Overview

This project contains a collection of 3D models with corresponding texture renders, along with a Viewport-based rendering system. The setup allows for rendering 3D objects to a texture that can be used elsewhere in the project, such as for UI elements, sprite sheets, or dynamic texture generation.

## Features

- Multiple 3D models including:
  - Aircraft model (aircos0)
  - Ammo box
  - Antenna
  - Barrel
- Pre-rendered PNG outputs of each model
- Godot 3.x project structure
- Viewport rendering script for dynamic texture generation
- Utility Python scripts for code analysis and directory visualization

## Project Structure

- `models/` - Contains 3D model files (.glb format) and their material definitions
- `renders/` - Pre-rendered PNG images of each model
- `viewport_renderer.gd` - Main GDScript for Viewport-based rendering
- `test0.tscn` - Test scene for the rendering setup
- `default_env.tres` - Default environment settings

## Getting Started

1. Open the project in Godot 3.x
2. Explore the `test0.tscn` scene to see the Viewport rendering in action
3. Check `viewport_renderer.gd` for the rendering implementation
4. Use the Python utilities to analyze the project structure if needed

## Requirements

- Godot 3.x
- 3D models are in .glb format (glTF Binary)

## Notes

This is an experimental project focused on Viewport rendering techniques in Godot. The models and renders serve as test assets for the rendering pipeline.
