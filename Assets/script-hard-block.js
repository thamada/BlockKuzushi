#pragma strict
 
var hp :int = 8;

var obj :GameObject;
var script :script_scene;
 
obj = GameObject.Find("script-scene");
script = obj.GetComponent(script_scene);


function Start(){
	hp = 3;
	Debug.Log("hp: "+ hp);
}
 
function OnCollisionEnter() {
    hp--;
    if (hp == 0){
        Destroy(gameObject);
        script.score += 8;
    }else{
	    script.score += 1;
    }

    Debug.Log("hp: "+hp);


}