#pragma strict
 
var style1 :GUIStyle;
 
function OnGUI () {
    GUI.Label(Rect(10, 10, 300, 100), "Game Over !!", style1);

    if(GUI.Button (Rect (10,200,100,20), "Start Again")){
    	UnityEngine.SceneManagement.SceneManager.LoadScene("main");
	}

	if (Input.GetKey(KeyCode.Escape)) {
		Application.Quit();
		Debug.Log("Quit Game");
	}
}

