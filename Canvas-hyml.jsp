<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Page title</title>
<script src="" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href=" " />
<style type="text/css">
/** code for rec-1**/
#mycanvas{border: 1px red solid;}

/**code for rec-2**/
#canvas2 {
width: 100px;
height: 100px;
margin: 0px auto;

}

/**code for rec-3**/
#canvas3 {
width: 200px;
height: 150px;
margin: 0px auto;
border: 1 px red solid;
}
</style>
</head>
<body id="test" onload=" drawShape2(); drawShape3();">
<p> Canvas Rectangle (rec-1):<br/>
<canvas id="mycanvas" width="150" height="150"></canvas>
</p>
<p>Canvas Rectangle2 (rec-2) : <br/>
<canvas id="canvas2" ></canvas>
</p>

<p>Canvas Drawing smiley (rec-3):<br/>
<canvas id="canvas3"></canvas>
</p>

<p>To display a video player.<br/>
<video width="300" height="300" controls="controls" autoplay>
<source src="html5/foo.mp4" type="video/mp4">
your browser does not supoort &lt; video &gt; element
</video>
 </p>
 
 <p>To display Geolocation.<br/>
<form>
<input type="button" onclick="getLocation();" value="GetLocation"/>
</form>
</p>
<script type="text/javascript">
/** code for rec-2**/
  function drawShape2(){
	var canvas=document.getElementById("canvas2");
	//make sure we dont execute when canavas isnt supported
	if (canvas.getContext) {
		// use the getContext to use canvas for drwaing
		var ctx=canvas.getContext('2d');
		ctx.fillRect(25,25,100,100);
		ctx.clearRect(45,45,60,60);
		ctx.strokeRect(50,50,50,50);
	}
	else {
		alert("You need safari or firefox 1.5+ to see this demo.");
	}
}
	function drawShape3() {
		/**code for rec-3**/
		var canvas=document.getElementById("canvas3");
		if(canvas.getContext){
			var ctx=canvas.getContext("2d");
			//draw shapes
			ctx.beginPath();
			ctx.arc(75,75,50,0,Math.PI*2,true);//outer circcle
			
			ctx.moveTo(110,75);
			ctx.arc(75,75,35,0,Math.PI,false);//mouth
			
			ctx.moveTo(65,65);
			ctx.arc(60,65,5,0,Math.PI*2,true);//left eye
			
			ctx.moveTo(95,65);
			ctx.arc(90,65,5,0,Math.PI*2,true);//right eye
			
			ctx.stroke();
		}
		else {
			alert("You need safari or firefox 1.5+ to see this demo.");
		}
	}
	function showlocation(position) {
		var latitude =position.coords.latitude;
		var longitude=position.coords.longitude;
		alert("latitude : "+latitude+"Longitude:"+longitude);
	}
	function errorHandler(err) {
		if(err.code==1){
			alert("access is denied");
		}
		else if (err.code==2) {
			alert("Error:Position is unavailable!");
		}
	}
	function getLocation() {
		if (navigator.getlocation) {
			//timeout at 60000 milliseconds (60 seconds)
			var options ={timeout:60000};
			navigator.getlocation.getCurrentPosition(showLocation,errorHandler,options);
		}
		else {
			alert("sorry,browser does not support geolocation!");
		}
	}
</script>
</body>
</html>