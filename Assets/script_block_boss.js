#pragma strict

var hp :int;

var obj :GameObject;
var script :script_scene;

function Start(){
  obj = GameObject.Find("script-scene");
  script = obj.GetComponent(script_scene);
<<<<<<< HEAD
	hp = 8;
=======
	hp = 1;
>>>>>>> b20427cb5ab8918d5a80a147313ab18451250312
}

function OnCollisionEnter() {
    hp--;
    if (hp == 0){
        Destroy(gameObject);
        script.score += 8;
        script.blockCt -= 1;
				UnityEngine.SceneManagement.SceneManager.LoadScene("GameClear");
    }else{
	    script.score += 1;
    }
    Debug.Log("hp: "+hp);
}
