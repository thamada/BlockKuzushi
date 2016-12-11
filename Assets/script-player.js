#pragma strict
 
var Accel :float = 100.0;
 
function Update () {
    GetComponent.<Rigidbody>().AddForce(transform.right * Input.GetAxisRaw("Horizontal") * Accel, ForceMode.Impulse);

//    GetComponent.<Rigidbody>().AddForce(transform.right * Input.GetAxis("Horizontal") * Accel, ForceMode.Impulse);
//	Debug.Log("Player force: "+ Input.GetAxis("Horizontal"));

}