using Godot;
using System;

public partial class pause_menu : Control
{
	private Control _settingsMenu;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		GetTree().Paused = false;
		Hide();
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		if(Input.IsActionJustPressed("escape")){
			SetOrDisablePause();
		}
	}
	
	private void Resume(){
		GetTree().Paused = false;
		Input.MouseMode = Input.MouseModeEnum.Captured;
		Hide();
	}
	
	public void Pause(){
		Show();
		Input.MouseMode = Input.MouseModeEnum.Visible;
		GetTree().Paused = true;
	}
	
	public void SetOrDisablePause(){
		if(GetTree().Paused){
			Resume();
		} else {
			Pause();
		}
	}
	
	private void OpenMainMenu()
	{
	GetTree().ChangeSceneToFile("res://scenes/main_menu.tscn");
	}
}



