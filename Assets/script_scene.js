﻿#pragma strict

#pragma strict
 
var life :int = 3;
var score :int = 0;
var is_clear :boolean = false;


function Start () {
    DontDestroyOnLoad(this);
}

function Update () {

	if (is_clear == false){
	    if (score > 100){
    	    Application.LoadLevel("GameClear");
    	    is_clear = true;
	    }	
	}

}
