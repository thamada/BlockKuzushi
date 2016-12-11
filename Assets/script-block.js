#pragma strict

var obj :GameObject;
var script :script_scene;
 
obj = GameObject.Find("script-scene");
script = obj.GetComponent(script_scene);


function OnCollisionEnter () {
    Destroy(gameObject);
    script.score += 2;
}

