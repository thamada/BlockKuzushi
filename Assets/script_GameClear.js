#pragma strict
 
var style2 :GUIStyle;
var obj :GameObject;
var script :script_scene;
 
obj = GameObject.Find("script-scene");
script = obj.GetComponent(script_scene);
 
function OnGUI () {
    GUI.Label(Rect(80, 10, 300, 80), "Game Clear !!", style2);
    GUI.Label(Rect(120, 90, 300, 100), "スコア：" + (script.score + script.life*100), style2);
}


