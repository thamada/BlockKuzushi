﻿#pragma strict

var hp :int;
var obj :GameObject;
var script :script_scene;

function Start(){
  obj = GameObject.Find("script-scene");
  script = obj.GetComponent(script_scene);
	hp = 3;
}

function OnCollisionEnter() {
    hp--;
    if (hp == 0){
        Destroy(gameObject);
        script.score += 8;
        script.blockCt -= 1;
    }else{
	    script.score += 1;
    }
    Debug.Log("hp: "+hp);
}
