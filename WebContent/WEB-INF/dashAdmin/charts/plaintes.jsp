<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<style>
#chartContainer {
    width: 70%;
    height: 500px;
    margin: 0 auto;
    margin-top:-370px;
}
</style>
</head>
<body>
    <div id="chartContainer"></div>
    <script type="text/javascript">
        var chart = new CanvasJS.Chart("chartContainer", {
        	  backgroundColor: "whitesmoke",
            title:{
                text: "Nombre de crimes par région pendant l'an "
            },
            axisX: {
                title: "Régions",
                interval: 1,
                gridThickness: 0
            },
            axisY: {
                title: "Nombre de crimes",
                gridThickness: 0
            },
            data: [
                {
                    type: "column",
                    dataPoints: [
                        { label: "Tanger-Tétouan-Al Hoceima", y: ${NumChartsTTAH} },
                        { label: "Rabat-Salé-Kénitra", y: ${NumChartsRSK}  },
                        { label: "L'Oriental", y: ${NumChartsOR} }  ,
                        { label: "Fès-Meknès", y: ${NumChartsFM} }  ,
                        { label: "Beni Mellal-Khénifra", y: ${NumChartsBMK} }  ,
                        { label: "Casablanca-Settat", y: ${NumChartsCS} }  ,
                        { label: "Marrakech-Safi", y: ${NumChartsMRS} }  ,
                        { label: "Drâa-Tafilalet", y: ${NumChartsDT} }  ,
                        { label: "Souss-Massa", y: ${NumChartsSM} }  ,
                        { label: "Guelmim-Oued Noun", y: ${NumChartsGON} },
                        { label: "Laâyoune-Sakia El Hamra", y: ${NumChartsLSH} }  ,
                        { label: "Dakhla-Oued Ed Dahab", y: ${NumChartsSM} }  
                    ]
                }
            ]
        });
        chart.render();

</script>
<script type="text/javascript">
function toggleSidebar() {
	  var sidebar = document.getElementById("sidebar");
	  var main = document.getElementById("main");
	  var tableusers = document.getElementById("tableUsers");
	  var currentWidth = sidebar.style.width;
	  
	  if (currentWidth === "0px" || currentWidth === "") {
	    openSidebar();
	  } else {
	    closeSidebar();
	  }
	}
function openSidebar() {
document.getElementById("sidebar").style.width = "269px";/*269px*/
document.getElementById("main").style.marginLeft = "250px";
document.getElementById("idfaq").style.marginLeft = "250px";
document.getElementById("tableUsers").style.marginLeft = "269px";
document.getElementById("chartContainer").style.marginLeft = "269px";
document.body.style.backgroundColor = "whitesmoke";/*#e6e8ed*/


}

function closeSidebar() {
document.getElementById("sidebar").style.width = "0";
document.getElementById("main").style.marginLeft= "0";
document.getElementById("idfaq").style.marginLeft = "0";
document.getElementById("tableUsers").style.marginLeft = "90px";
document.getElementById("chartContainer").style.marginLeft = "0";
document.body.style.backgroundColor = "white";
}

</script>

</head>
<body>
<div id="chartContainer" style="height: auto; width: auto;"></div>
</body>
</html>