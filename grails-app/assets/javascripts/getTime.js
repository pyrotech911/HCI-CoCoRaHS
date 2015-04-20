/**
 * 
 */
function getTime() {
	var date = new Date()
	var str = date.toString()
	str = str.substring(0, str.indexOf("GMT") - 1)

	document.getElementById("time").innerHTML = str;
}
