﻿#pragma strict
 
var style :GUIStyle;
var obj :GameObject;
var script :script_scene;
var windowRect : Rect = Rect (0, 0, 150, 250);

function OnGUI() {
    obj = GameObject.Find("script-scene");
    script = obj.GetComponent(script_scene);
 
/*
    GUI.Label(Rect(10, 10, 200, 40), "点数", style);
    GUI.Label(Rect(10, 50, 200, 40), "" + script.score, style);
    GUI.Label(Rect(10, 120, 200, 40), "残機数", style);
    GUI.Label(Rect(10, 160, 200, 40), "" + script.life, style);
*/


    windowRect = GUI.Window (0, windowRect, DoMyWindow, "Status");
//    Debug.Log("windowRect: "+ windowRect);
}

function DoMyWindow (windowID : int) {

    GUI.Label(Rect(10, 10, 200, 40), "点数", style);
    GUI.Label(Rect(10, 50, 200, 40), "" + script.score, style);
    GUI.Label(Rect(10, 120, 200, 40), "残機数", style);
    GUI.Label(Rect(10, 160, 200, 40), "" + script.life, style);


	if(GUI.Button (Rect (10,200,100,20), "Quit")){
    	Application.LoadLevel("GameOver");
	}

	if (Input.GetKey(KeyCode.Escape)) {
		Application.LoadLevel("GameOver");
	}


	// Make a very long rect that is 20 pixels tall. 
	// This will make the window be resizable by the top
	// title bar - no matter how wide it gets.
	GUI.DragWindow (Rect (0,0, 10000, 200));
}
