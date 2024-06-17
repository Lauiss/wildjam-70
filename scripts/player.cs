using Godot;
using System;

public partial class player : CharacterBody3D
{
	//global movement variables
	public float SPEED;
	public float WALK_SPEED;
	public float SPRINT_SPEED;
	public float JUMPVELOCITY;
	private global_variables _global;
	public float GRAVITY = 9.8f;
	public float SENSITIVITY = 0.003f;
	
	// accumulators for camera
	private float _rotationX = 0f;
	private float _rotationY = 0f;
	
	
	private Node3D _head;
	private Camera3D _camera;
	private Control _pauseMenu;
	
	private hand _hand; 
	
	public override void _Ready(){
		_head = GetNode<Node3D>("Head");
		_camera = GetNode<Camera3D>("Head/Camera");
		_hand = GetNode<hand>("Hand");
		_global = GetTree().Root.GetNode<global_variables>("Global");
		
		WALK_SPEED = _global.WALK_SPEED;
		SPRINT_SPEED = _global.SPRINT_SPEED;
		JUMPVELOCITY = _global.JUMPVELOCITY;
		Input.MouseMode = Input.MouseModeEnum.Captured;
	}
	
	public override void _PhysicsProcess(double delta)
	{
		Vector3 velocity = Velocity;

		// Add the GRAVITY.
		if (!IsOnFloor())
			velocity.Y -= GRAVITY * (float)delta;

		if (Input.IsActionJustPressed("jump") && IsOnFloor()){
			velocity.Y = JUMPVELOCITY;
		}
			
		if (Input.IsActionPressed("sprint")){
			SPEED = SPRINT_SPEED;
		} else {
			SPEED = WALK_SPEED;
		}
		
		// Get the input direction and handle the movement/deceleration.
		Vector2 inputDir = Input.GetVector("left", "right", "up", "down");
		Vector3 direction = (Transform.Basis * new Vector3(inputDir.X, 0, inputDir.Y)).Normalized();
		if(IsOnFloor()){
			if (direction != Vector3.Zero)
			{
				velocity.X = direction.X * SPEED;
				velocity.Z = direction.Z * SPEED;
			}
			else
			{
				// stopping character when no key is pressed 
				velocity.X = 0.0f;
				velocity.Z = 0.0f;
			}
		} else { // keeping moving even if not touching the keys anymore
			velocity.X = Mathf.Lerp(velocity.X, direction.X * SPEED, (float)delta * 2.0f);
		}
		
		Velocity = velocity;
		MoveAndSlide();
	}
	
	public override void _UnhandledInput(InputEvent @event)
	{
		// camera handling
		if (@event is InputEventMouseMotion mouseMotion){
			HandleCameraMovement(mouseMotion);
		}
		
		//interaction handling
 		if (Input.IsActionPressed("interact")){
			GD.Print("Interaction");	
		}
	}
	
	private void HandleCameraMovement(InputEventMouseMotion mouseMotion){
		// modify accumulated mouse rotation
		_rotationX += mouseMotion.Relative.X * SENSITIVITY;
		_rotationY += mouseMotion.Relative.Y * SENSITIVITY;

		// reset rotation
		Transform3D transform = Transform;
		transform.Basis = Basis.Identity;
		Transform = transform;

		RotateObjectLocal(Vector3.Up, -_rotationX); // first rotate about Y
		RotateObjectLocal(Vector3.Right, Mathf.Clamp(-_rotationY, -1f, .50f)); // then rotate about X clamping to lock camera
	}
	
}
