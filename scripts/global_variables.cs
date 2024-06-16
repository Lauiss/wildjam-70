using Godot;
using System;

public partial class global_variables : Node
{
	public const float WALK_SPEED = 0.0f;
	public const float SPRINT_SPEED = 0.0f;
	public const float JUMPVELOCITY = 0.0f;
	
	public void setWalkSpeed(float f){
		WALK_SPEED = f;
	}
}
