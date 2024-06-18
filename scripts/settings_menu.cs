using Godot;
using System;

public partial class settings_menu : Control
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
	
	private void BackToMainMenu()
	{
		GetTree().ChangeSceneToFile("res://scenes/main_menu.tscn");
	}
}


