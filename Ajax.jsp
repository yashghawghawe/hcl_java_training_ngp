<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ajax-1</title>
<script src="" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href=" " />
</head>

<body>
<p>Start of AJAX Example:</br>
<marquee><h1>This is an Example of Ajax</h1></marquee>
<form name="formajax">
<input type="text" name="text1" value="2" />
<input type="button" value="showTable" onclick="sendInfo()"/>
</form>

<span id="dragon"></span>
 </p>
<script type="text/javascript">
/** Call to Ajax**/
var request;
function sendInfo() {
	var v=document.formajax.text1.value;
	var url="AjaxInfo.jsp?val="+v;
	
	if (window.XMLHttpRequest) {
		request=new XMLHttpRequest();
	}
	else if (window.ActiveXObject) {
		request=new ActiveXObject("Microsoft.XMLHTTP");
	}
	try {
		request.onreadystatechange=getInfo;
		request.open("Get",url,true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}
function getInfo() {
	if (request.readyState==4) {
		var val=request.responseText;
		document.getElementById('dragon').innerHTML=val;
	}
}

</script>
</body>
</html>