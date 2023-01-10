<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Admin Dashboard</title>

    <!-- Montserrat Font -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- Font Icons -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">   
             
    <!-- Custom CSS -->
<%@include file="/WEB-INF/dashAdmin/headerAdmin.jsp" %>        
  </head>
  <body>
    
    <div class="grid-container-charts" id="main-charts">
      <!-- Main -->
      <main class="main-container-charts">
        <div class="charts">
          <div class="charts-card">
            <p class="chart-title">Top 5 Products</p>
            <div id="bar-chart"></div>
          </div>

          <div class="charts-card">
            <p class="chart-title">Purchase and Sales Orders</p>
            <div id="area-chart"></div>
          </div>

        </div>
      </main>
      <!-- End Main -->

    </div>

    <!-- Scripts -->
    <!-- ApexCharts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.3/apexcharts.min.js"></script>
    <!-- Custom JS -->
    <script src="<%=request.getContextPath()%>/WebRessources/js/dashAdmin.js"></script>
  </body>
</html>
<script>
function toggleSidebar() {
	  var sidebar = document.getElementById("sidebar");
	  var main = document.getElementById("main");
	  var mainCharts = document.getElementById("main-charts");
	  var currentWidth = sidebar.style.width;
	  
	  if (currentWidth === "0px" || currentWidth === "") {
	    openSidebar();
	  } else {
	    closeSidebar();
	  }
	}
function openSidebar() {
	document.getElementById("sidebar").style.width = "269px";
	document.getElementById("main").style.marginLeft = "250px";
	document.getElementById("main-charts").style.marginLeft = "250px";
	document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
	}
	
function closeSidebar() {
	document.getElementById("sidebar").style.width = "0";
	document.getElementById("main").style.marginLeft= "0";
	document.getElementById("main-charts").style.marginLeft = "0";
	document.body.style.backgroundColor = "#e6e8ed";
}

</script>
<style>
@charset "UTF-8";

.grid-container-charts {
  display: grid;
  grid-template-columns: 1fr 1fr; /* create 2 equal-width columns */
  grid-template-rows: auto; /* adjust height to fit content */
  gap: 20px; /* add gap between columns */
}

.main-container-charts {
  grid-column: span 2; /* place the main container spanning 2 columns */
}

/* ---------- MAIN ---------- */ 

.main-charts{
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr;
  gap: 20px;
  margin: 20px 0;
}
.main-title {
  display: flex;
  justify-content: space-between;
}

.main-title > p {
  font-size: 20px;
}
.charts {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
    margin-right:1000px;
  
}

.charts-card {
  background-color: #ffffff;
  margin-bottom: 20px;
  margin-top:-300px;
  padding: 0px;
  width:100%;
  box-sizing: border-box;
  -webkit-column-break-inside: avoid;
  border: 1px solid #d2d2d3;
  border-radius: 5px;
  box-shadow: 0 6px 7px -4px rgba(0, 0, 0, 0.2);
}

.chart-title {
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 22px;
  font-weight: 600;
}
</style>
