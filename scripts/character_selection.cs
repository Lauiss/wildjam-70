using Godot;
using System;

public partial class character_selection : Control
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
	
	private void LoadSceneWithCharacter()
	{
		GlobalVariables.setWalkSpeed(5.0f);
		GlobalVariables.SPRINT_SPEED = 10.0f;
		GlobalVariables.JUMPVELOCITY = 4.5f;
		var nextScene = (PackedScene)ResourceLoader.Load("res://scenes/playground.tscn");
		GetTree().ChangeSceneToPacked(nextScene);
	}
}
