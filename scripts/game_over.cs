using Godot;
using System;

public partial class game_over : Control
{
	private global_variables _global;
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		_global = GetTree().Root.GetNode<global_variables>("GlobalVariables");
		
		if(_global.IS_WIN){
			GetNode<Label>("You_won").Visible = true;
		} else {
			GetNode<Label>("You_died").Visible = true;
		}
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
	
		private void PlayAgain()
	{
		GetTree().ChangeSceneToFile("res://scenes/cinematic.tscn");
	}
	
	private void ExitGame()
	{
		GetTree().Quit();
	}
}
