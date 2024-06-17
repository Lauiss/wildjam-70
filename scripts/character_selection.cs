using Godot;
using System;

public partial class character_selection : Control
{
	private global_variables _global;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		_global = GetTree().Root.GetNode<global_variables>("Global");
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
	
	private void LoadSceneWithCharacter()
	{
		_global.WALK_SPEED = 5.0f;
		_global.SPRINT_SPEED = 10.0f;
		_global.JUMPVELOCITY = 4.5f;
		_global.GotoScene("res://scenes/playground.tscn");
	}
}
