#pragma strict
var Speed : float = 15.0;

var pos : Vector3;
var vel : Vector3;
        
function Update () {

//	vel = GetComponent.<Rigidbody>().velocity;
//	Debug.Log("pos"+transform.position);

    if (Input.GetButtonUp("Jump") && GetComponent.<Rigidbody>().velocity == Vector3(0, 0, 0)){
        GetComponent.<Rigidbody>().AddForce((transform.forward + transform.right) * Speed, ForceMode.VelocityChange);
    }
}


function OnCollisionEnter () {
    GetComponent.<Rigidbody>().velocity = GetComponent.<Rigidbody>().velocity.normalized * 15;
 
    if (Mathf.Abs(GetComponent.<Rigidbody>().velocity.y) < 5) {
        GetComponent.<Rigidbody>().velocity.y *= 5;
    }
    if (Mathf.Abs(GetComponent.<Rigidbody>().velocity.x) < 5) {
        GetComponent.<Rigidbody>().velocity.x *= 5;
    }
}

