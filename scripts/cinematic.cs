using Godot;
using System;

public partial class cinematic : Control
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		if (Input.IsActionJustPressed("jump")){
			GetTree().ChangeSceneToFile("res://scenes/character_selection.tscn");
		}
	}
	
	private void _on_video_stream_player_finished()
	{
		GetTree().ChangeSceneToFile("res://scenes/character_selection.tscn");
	}
}
