#pragma strict
import System.IO;

var life :int = 3;
var score :int = 0;
var blockCt :int;


function Start () {
    DontDestroyOnLoad(this);
    blockCt = 104;
}

function Update () {
  if(blockCt == 0){
    UnityEngine.SceneManagement.SceneManager.LoadScene("GameClear");
    blockCt -= 1;
  }

  textSave();
}



function textSave () {
    var sw:StreamWriter;
    var t = ""+UnityEngine.Time.time;
    

    sw = new StreamWriter("./log.txt", true);
    sw.WriteLine(t+", blockCt: "+blockCt);
    sw.Close();
}
