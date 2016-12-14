#pragma strict
 
var style :GUIStyle;
var windowRect : Rect = Rect (250, 0, 200, 30);

function Start() {
	windowRect = Rect(250,0, 200,30);
}


function OnGUI() {
    windowRect = GUI.Window (1, windowRect, DoMyWindow, "Status");
}

function DoMyWindow (windowID : int) {
	GUI.Label(Rect(10, 10, 100, 30), "Platform: " + Application.platform, style);
	GUI.DragWindow (Rect (0,0, 10000, 200));
}

