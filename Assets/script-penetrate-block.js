﻿#pragma strict


var obj :GameObject;
var script :script_scene;

function Start(){
  obj = GameObject.Find("script-scene");
  script = obj.GetComponent(script_scene);
}


GetComponent.<Collider>().isTrigger = true;

function OnTriggerEnter() {
    Destroy(gameObject);

    script.score += 1;
    script.blockCt -= 1;
}
