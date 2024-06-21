using Godot;
using System;

public partial class character_selection : Control
{
	private global_variables _global;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		_global = GetTree().Root.GetNode<global_variables>("GlobalVariables");
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
	
	private void LoadSceneWithCharacter()
	{
		// last param vector is to manage size of the character
		SetCharacterVariables(5.0f, 10.0f, 4.5f, new Vector3(1,1,1));
		GetTree().ChangeSceneToFile("res://scenes/playground.tscn");
	}
	
	private void SetCharacterVariables(float WalkS, float SprintS, float Jvelocity, Vector3 CharSize)
	{
		_global.WALK_SPEED = WalkS;
		_global.SPRINT_SPEED = SprintS;
		_global.JUMP_VELOCITY = Jvelocity;
		_global.CHARACTER_SIZE = CharSize;
	}
}
