#pragma strict
using System.IO;

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

  var t = ""+UnityEngine.Time.time;
  textSave(t+"¥t"+blockCt);
}


public void textSave(string txt){
	StreamWriter sw = new StreamWriter("./Temp/log.txt",false); //true=append false=create_new
	sw.WriteLine(txt);
	sw.Flush();
	sw.Close();
}
