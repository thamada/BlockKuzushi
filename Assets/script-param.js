#pragma strict

var style :GUIStyle;
var obj :GameObject;
var script :script_scene;
var windowRect : Rect = Rect (0, 0, 150, 250);

function Start(){
    obj = GameObject.Find("script-scene");
    script = obj.GetComponent(script_scene);
    style.fontSize = 24;
}

// OnGUI() is called in every frame like Update()
function OnGUI() {
    windowRect = GUI.Window (0, windowRect, DoMyWindow, "Status");
}

function DoMyWindow (windowID : int) {

    GUI.Label(Rect(10, 20, 200, 40),  "Score: "+ script.score, style);
    GUI.Label(Rect(10, 60, 200, 40),  "Life: " + script.life, style);
    GUI.Label(Rect(10, 100, 200, 40),  "Block: " + script.blockCt, style);


	if(GUI.Button (Rect (10,200,100,20), "Quit")){
    	UnityEngine.SceneManagement.SceneManager.LoadScene("GameClear");
	}

	if (Input.GetKey(KeyCode.Escape)) {
		UnityEngine.SceneManagement.SceneManager.LoadScene("GameOver");
	}



	// Make a very long rect that is 20 pixels tall.
	// This will make the window be resizable by the top
	// title bar - no matter how wide it gets.
	GUI.DragWindow (Rect (0,0, 10000, 200));
}
