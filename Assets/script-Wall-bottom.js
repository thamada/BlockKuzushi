#pragma strict

var obj :GameObject;
var script :script_scene;
var ball :Transform;
 
obj = GameObject.Find("script-scene");
script = obj.GetComponent(script_scene);


function OnCollisionEnter (collision : Collision) {
    Destroy(collision.gameObject);

    if (script.life > 0){
		Instantiate(ball);
	 	script.life--;
 	} else if (script.life == 0){
        UnityEngine.SceneManagement.SceneManager.LoadScene("GameOver");
    }

}

