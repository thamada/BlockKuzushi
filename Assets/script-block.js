#pragma strict

var obj :GameObject;
var script :script_scene;

function Start(){
  obj = GameObject.Find("script-scene");
  script = obj.GetComponent(script_scene);
}


function OnCollisionEnter () {
    Destroy(gameObject);
    script.score += 2;
    script.blockCt -= 1;
}
