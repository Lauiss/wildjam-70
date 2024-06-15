using Godot;
using System;

public partial class main_menu : Control
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
	
	private void start_game()
	{
		GetTree().ChangeSceneToFile("res://scenes/playground.tscn");
	}
	
	private void exit_game()
	{
		GetTree().Quit();
	}
	
	private void open_settings()
	{
		GetTree().ChangeSceneToFile("res://scenes/settings_menu.tscn");
	}
}
