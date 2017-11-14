<!DOCTYPE HTML>
<html>
<head>
<script>
window.onload = function () {
	
//var source = new EventSource("http://localhost:8080/UserManagement/rest/webservice");
var dps = []; // dataPoints
var chart = new CanvasJS.Chart("chartContainer", {
	title :{
		text: "Heartbeat Monitor"
	},
	axisY: {
		includeZero: false
	},      
	data: [{
		type: "line",
		dataPoints: dps
	}]
});

var xVal = 0;
var yVal = 74;
var yVal1 = 74;
var updateInterval = 1000;
var dataLength = 80; // number of dataPoints visible at any point






var updateChart=function (count) {
     count=count || 1;
     
	var xmlhttp = new XMLHttpRequest();
	var url = "http://localhost:8080/UserManagement/rest/webservice";
	
	
	
	xmlhttp.open("GET", url, true);
			
	xmlhttp.onreadystatechange = function() {
	    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
	    	
	        var myArr = JSON.parse(xmlhttp.responseText);
	       	alert(myArr);      
	        for(var j=0;j<count;j++){
	        yVal=myArr[j]+ (Math.round(25 + Math.random() *(-5-5)))%50;
	        
			dps.push({
			x: xVal,
			y: yVal
		});
		xVal++;
			}
	        
	        if (dps.length > dataLength) {
				dps.shift();
			}
		
	}
	}
	xmlhttp.send();
	chart.render();
}

updateChart(dataLength);
setInterval(function(){updateChart()}, updateInterval);

}
</script>
</head>
<body>
<!--<div id="notSupported">
	Your browser does not support Server Sent Events.
	Please use <a href="https://www.mozilla.org/firefox/new/">Firefox</a>
	or <a href="https://www.google.com/chrome/browser">Google Chrome</a>.
</div> -->
<div id="chartContainer" style="height: 650px; width:80%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>