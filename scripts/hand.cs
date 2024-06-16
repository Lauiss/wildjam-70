using Godot;
using System;

public partial class hand : Control
{
	private bool IsShowed;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		IsShowed = false;
		Hide();
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		if (Input.IsActionJustPressed("showhand")){
			ChangeVisibility();
		}
	}
	
	public void ChangeVisibility(){
		IsShowed = !IsShowed;
		ShowHand();
	}
	
	public void ShowHand(){
		GD.Print(IsShowed);
		if(IsShowed){
			Show();
		} else {
			Hide();
		}
	}
}
