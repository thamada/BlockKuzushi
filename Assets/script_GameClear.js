#pragma strict
 
var style2 :GUIStyle;
var obj :GameObject;
var script :script_scene;

function Start() { 
	obj = GameObject.Find("script-scene");
	script = obj.GetComponent.<script_scene>();
}

function Update() {
	if (Input.GetKey(KeyCode.Escape)) {
		Application.Quit();
	}

	Debug.Log("score"+script.score);

}


function OnGUI () {
    GUI.Label(Rect(80,  10,  300, 10), "Game Clear !!", style2);
    GUI.Label(Rect(80,  30,  300, 10), "ESC -> Quit", style2);

    if(script == null) {
    	GUI.Label(Rect(80,  60,  300, 10), "Total Score: " + 777, style2);
    }else{
    	GUI.Label(Rect(80,  60,  300, 10), "Total Score: " + (script.score + script.life*100), style2);
	}    
}


