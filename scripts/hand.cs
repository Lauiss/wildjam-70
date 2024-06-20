using Godot;
using System;


public partial class hand : Control
{
	[Signal]
	public delegate void ClickedWithHandEventHandler();

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
		
		if(IsShowed && Input.IsActionJustPressed("holdordrop")){
			GD.Print("ok zoomer");
			//EmitSignal(SignalName.ClickedWithHandEventHandler);
		}
	}
	
	public void ChangeVisibility(){
		IsShowed = !IsShowed;
		ShowHand();
	}
	
	public void ShowHand(){
		if(IsShowed){
			Show();
		} else {
			Hide();
		}
	}
}
