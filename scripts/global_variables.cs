using Godot;
using System;

public partial class global_variables: Node
{
	public Node CurrentScene { get; set; }
	public float WALK_SPEED { get; set; }
	public float SPRINT_SPEED { get; set; }
	public float JUMP_VELOCITY { get; set; }
	public Vector3 CHARACTER_SIZE { get; set; }

	public override void _Ready()
	{
		Viewport root = GetTree().Root;
		CurrentScene = root.GetChild(root.GetChildCount() - 1);
	}
	
	public void GotoScene(string path)
{
	CallDeferred(MethodName.DeferredGotoScene, path);
}

public void DeferredGotoScene(string path)
{
	// It is now safe to remove the current scene.
	CurrentScene.Free();

	// Load a new scene.
	var nextScene = GD.Load<PackedScene>(path);

	// Instance the new scene.
	CurrentScene = nextScene.Instantiate();

	// Add it to the active scene, as child of root.
	GetTree().Root.AddChild(CurrentScene);

	// Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	GetTree().CurrentScene = CurrentScene;
}
	
}
