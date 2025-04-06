<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="today" value="<%=new java.util.Date()%>"/>
<fmt:formatDate value="${today}" pattern="yyyy" var="formattedDate"/> 
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
		<link rel="stylesheet" href="<%=request.getContextPath()%>/WebRessources/styles/dashAdmin.css" type="text/css">
  <style>
#img {
  margin-top:8px;
  margin-left:590px;
  width:auto;
  height:50px;
}
@charset "UTF-8";
body {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  background-color: whitesmoke;
  color: #666666;
  font-family: "Montserrat", sans-serif;
}
#img {
  margin-top:8px;
  margin-left:-990px;
  width:10%;
  height:40px;
}
.profile img
{
    display:block;
    width:100px;
    height:100px;
    border-radius:50%;
    margin-left:65px;    
    margin-top:-70px;

}
.material-icons-outlined {
  vertical-align: middle;
  line-height: 1px;
  
}

.text-primary {
  color: slategray;
}

.text-blue {
  color: gray;
}

.text-red {
  color: darkslategray;
}

.text-green {
  color: slategray;
}

.text-orange {
  color:  cadetblue;
}

.font-weight-bold {
  font-weight: 600;
}

.grid-container {
  display: grid;
  grid-template-columns: 260px 1fr 1fr 1fr;
  grid-template-rows: 0.2fr 3fr;
  grid-template-areas:
    "sidebar header header header"
    "sidebar main main main";
  height: 100vh;
}


/* ---------- HEADER ---------- */

.header {
  grid-area: header;
  height: 70px;
  background-color: #343a40;
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-left:-260px;
  padding: 0 30px 0 30px;
  box-shadow: 0 6px 7px -4px rgba(0, 0, 0, 0.2);
}

.menu-icon {
  display: none;
}


/* ---------- SIDEBAR ---------- */

#sidebar {
  grid-area: sidebar;
  height: 100%;
  width:0;
  position:fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #343a40;
  color: #9799ab;
  overflow-x: hidden;
  transition: 0.35s;
   padding-top: 60px;
}
.sidebar-title {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 20px 20px 20px 20px;
  margin-bottom: 30px;
}

.sidebar-title > span {
  display: none;
}

.sidebar-brand {
  margin-top: 100px;
  margin-bottom:7px;  
  margin-left:-160px;    
  font-size: 20px;
  font-weight: 700;
  text-align: center;
  border-bottom: double;
  
}

.sidebar-list {
  padding: 0;
  margin-top: -55px;
  list-style-type: none;
}

.sidebar-list-item {
  padding: 15px 20px 20px 20px;
}

.sidebar-list-item:hover {
  background-color: rgba(255, 255, 255, 0.2);
  cursor: pointer;
}

.sidebar-list-item > a {
  text-decoration: none;
  color: #9799ab;
}

.sidebar-responsive {
  display: inline !important;
  position: absolute;
  /*
    the z-index of the ApexCharts is 11
    we want the z-index of the sidebar higher so that
    the charts are not showing over the sidebar 
    on small screens
  */
  z-index: 12 !important;
}


/* ---------- MAIN ---------- */

.main-container {
  grid-area: main;
  overflow-y: auto;
  padding: 20px 20px;
  margin-left:-200px;
}

.main-title {
  display: flex;
  justify-content: space-between;
}

.main-title > p {
  font-size: 20px;
}

.main-cards {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr;
  gap: 20px;
  margin: 20px 0;
}

.card {
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  padding: 25px;
 background: linear-gradient(whitesmoke,#9799ab);/*#ffffff*/ 
/*   background-color : whitesmoke; */
  transition: 0.3s;
  box-sizing: border-box;
  border: 1px solid #d2d2d3;
  border-radius: 5px;
  box-shadow: 0 6px 7px -4px rgba(0, 0, 0, 0.2);
}

.card:first-child {
  border-left: 7px solid gray;
}

.card:nth-child(2) {
  border-left: 7px solid cadetblue ;
}

.card:nth-child(3) {
  border-left: 7px solid  slategray;
}

.card:nth-child(4) {
  border-left: 7px solid darkslategray;
}

.card > span {
  font-size: 20px;
  font-weight: 600;
}

.card-inner {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.card-inner > p {
  font-size: 18px;
}

.card-inner > span {
  font-size: 35px;
}


.charts {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
}

.charts-card {
 background: linear-gradient(whitesmoke,#9799ab);/*#ffffff*/ 
  margin-bottom: 20px;
  padding: 25px;
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


/* ---------- SCROLLBARS ---------- */

::-webkit-scrollbar {
  width: 5px;
  height: 6px;
}

::-webkit-scrollbar-track {
  box-shadow: inset 0 0 5px #a5aaad;
  border-radius: 10px;
}

::-webkit-scrollbar-thumb {
  background-color: #a5aaad;
  border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
  background-color: #343a40;
}


/* ---------- MEDIA QUERIES ---------- */


/* Medium <= 992px */
@media screen and (max-width: 992px) {
  .grid-container {
    grid-template-columns: 1fr;
    grid-template-rows: 0.2fr 3fr;
    grid-template-areas:
      "header"
      "main";
  }

  #sidebar {
    display: none;
  }

  .menu-icon {
    display: inline;
  }

  .sidebar-title > span {
    display: inline;
  }
}

/* Small <= 768px */
@media screen and (max-width: 768px) {
  .main-cards {
    grid-template-columns: 1fr;
    gap: 10px;
    margin-bottom: 0;
  }
  


}

/* Extra Small <= 576px */
@media screen and (max-width: 576px) {
  .header-left {
    display: none;
  }
}
</style>

  
  </head>
  <body>
    <div class="grid-container" id="main">

      <!-- Header -->
      <header class="header">
	  <span style="font-size:21px;cursor:pointer;color:#9799ab;"  id="toggle-button" onclick="toggleSidebar()">&#9776; Espace administrateur</span>
                
        <div class="header-left">
<!--           <span class="material-icons-outlined">search</span> -->
        </div>
        <div class="header-right">
          <span class="material-icons-outlined"><a style="font-size:16px;color:#9799ab;text-decoration:none;"href="indexServlet"><i class='fas fa-sign-out-alt'></i> Se déconnecter</a></span>
        
<!--           <span class="material-icons-outlined"><i class="fa fa-bell"></i></span> -->
<!--           <span class="material-icons-outlined"><i class='fas fa-mail-bulk'></i></span> -->
<!--           <span class="material-icons-outlined"><i class="fas fa-user-circle"></i></span> -->
<%--           <img id="img" src="<%=request.getContextPath()%>/WebRessources/images/logo.png" >         --%>
        </div>
      </header>
      <!-- End Header -->

      <!-- Sidebar -->
      <aside id="sidebar">
      
        <div class="sidebar-title">
        <div class="profile">
        <img src="https://th.bing.com/th/id/R.8f85b6b2f5bc209a6613da0d68b41c0f?rik=8qomGZAHqOl1hA&pid=ImgRaw&r=0" alt="">
		</div>
          <div class="sidebar-brand">
          Ahmed Alalami
          </div>
<!--             <a href="javascript:void(0)" class="material-icons-outlined"  onclick="closeSidebar()">&times;</a> -->
<a></a>
        </div>
        <ul class="sidebar-list">
          <li class="sidebar-list-item">
            <a href="dashAdmin" target="_blank">
              <span class="material-icons-outlined"><i class="fas fa-home"></i></span> Accueil
            </a>
          </li>        
          <li class="sidebar-list-item">
            <a href="desclarationsAdmin" target="_blank">
              <span class="material-icons-outlined"><i class="fas fa-bell"></i></span> Déclarations
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="temoignageAdmin" target="_blank">
              <span class="material-icons-outlined"><i class="fas fa-user"></i></span> Témoignages
            </a>
          </li>           
          <li class="sidebar-list-item">          
            <a href="crudUsers" target="_blank">
              <span class="material-icons-outlined"><i class="fas fa-users-cog"></i></span> Utilisateurs
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="crudPr" target="_blank">
              <span class="material-icons-outlined"><i class='fa fa-exclamation-triangle'></i></span> Personnes recherchées
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="crudPd" target="_blank">
              <span class="material-icons-outlined"><i class="fa fa-search-plus"></i></span> Personnes disparues
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="crudObj" target="_blank">
              <span class="material-icons-outlined"><i class="fa fa-search"></i></span> Propriétaires recherchées
            </a>
          </li>                    
          <li class="sidebar-list-item">
            <a href="crudPni" target="_blank">
              <span class="material-icons-outlined"><i class="fa fa-user"></i></span> Personnes non identifiées
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="faq" target="_blank">
              <span class="material-icons-outlined"><i class='fas fa-exclamation-circle'></i></span> FAQ
            </a>
          </li>
        </ul>
      </aside>
      <!-- End Sidebar -->

      <!-- Main -->
      <main class="main-container">
        <div class="main-title">
          <p class="font-weight-bold">Bienvenue sur votre espace personnel</p>
        </div>

        <div class="main-cards">

          <div class="card">
            <div class="card-inner">
              <p class="text-secondary">Utilisateurs</p>
              <span class="material-icons-outlined text-blue"> <i class='fas fa-users-cog'></i></span>
            </div>
            <span class="text-secondary font-weight-bold">${NumUsers  }</span>
          </div>

          <div class="card">
            <div class="card-inner">
              <p class="text-secondary">Personnes disparues</p>
              <span class="material-icons-outlined text-orange"><i class='fas fa-user'></i></span>
            </div>
            <span class="text-secondary font-weight-bold">${NumPdis}</span>
          </div>

          <div class="card">
            <div class="card-inner">
              <p class="text-secondary">Personnes recherchées</p>
              <span class="material-icons-outlined text-green"><i class='fas fa-exclamation-circle'></i></span>
            </div>
            <span class="text-secondary font-weight-bold">${NumPre}</span>
          </div>
          <div class="card">
            <div class="card-inner">
              <p class="text-secondary">Déclarations</p>
              <span class="material-icons-outlined text-red"><i class='fa fa-bell'></i></span>
            </div>
            <span class="text-secondary font-weight-bold">${NumPlaintes}</span>
          </div>

        </div>
        <div class="charts" id="chartsId">

          <div class="charts-card" id="barId">
            <p class="chart-title">Nombre de plaintes par région pendant ${formattedDate}</p>
            <div id="bar-chart"></div>
          </div>

          <div class="charts-card" id="areaId">
            <p class="chart-title">Tendance de criminalité à Casablanca</p>
            <div id="area-chart"></div>
          </div>
          <div class="charts-card" id="barId">
            <p class="chart-title">Nombre de crimes par région pendant ${formattedDate}</p>
            <div id="bar-chart2"></div>
          </div>

          <div class="charts-card" id="areaId2">
            <p class="chart-title">Répartition des crimes selon leurs types</p>
            <div id="pie-chart"></div>
          </div>          

        </div>
 
      </main>
      <!-- End Main -->

    </div>

    <!-- Custom JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.3/apexcharts.min.js"></script>
    
<%--     <script src="<%=request.getContextPath()%>/WebRessources/js/dashAdmin.js"></script> --%>
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
document.getElementById("barId").style.marginLeft = "10px";
document.getElementById("areaId").style.width= "90%";
document.getElementById("areaId2").style.width= "90%";
document.getElementById("idfaq").style.marginLeft = "250px";
document.getElementById("tableUsers").style.marginLeft = "269px";
document.getElementById("tablePersoDisparue").style.marginLeft = "269px";
document.body.style.backgroundColor = "whitesmoke";/*#e6e8ed*/

}

function closeSidebar() {
	
document.getElementById("sidebar").style.width = "0";
document.getElementById("main").style.marginLeft = "0";
document.getElementById("idfaq").style.marginLeft = "0";
document.getElementById("areaId").style.width= "auto";
document.getElementById("areaId2").style.width= "auto";
document.getElementById("tableUsers").style.marginLeft = "90px";
document.getElementById("tablePersoDisparue").style.marginLeft = "90px";
document.body.style.backgroundColor = "white";
}
var barChartOptions = {
		  series: [{
		    data: [${NumChartsTTAH2}, ${NumChartsRSK2}, ${NumChartsOR2}, ${NumChartsFM2}, ${NumChartsBMK2},${NumChartsCS2} , ${NumChartsMRS2},${NumChartsDT2} ,${NumChartsSM2} ,${NumChartsGON2} ,${NumChartsLSH2} ,${NumChartsDOED2} ] 
		 

		  }],
		  chart: {
		    type: 'bar',
		    height: 350,
		    toolbar: {
		      show: false
		    },
		  },
		  colors: [
			    "#246dec",
			    "#cc3c43",
			    "#367952",
			    "#4f35a1",
			    "#4f35a1",
			    "cadetblue",
			    "yellow",
			    "red",  
			    "orange",
			    "silver",
			    "green",
			    "blue"     
		  ],
		  plotOptions: {
		    bar: {
		      distributed: true,
		      borderRadius: 4,
		      horizontal: false,
		      columnWidth: '55%',
		    }
		  },
		  dataLabels: {
		    enabled: false
		  },
		  legend: {
		    show: false
		  },
		  xaxis: {
		    categories: ["Tanger-Tétouan-Al Hoceima", "Rabat-Salé-Kénitra", "L'Oriental", "Fès-Meknès", "Beni Mellal-Khénifra","Casablanca-Settat","Marrakech-Safi","Drâa-Tafilalet","Souss-Massa","Guelmim-Oued Noun","Laâyoune-Sakia El Hamra","Dakhla-Oued Ed Dahab"],
		  },
		  yaxis: {
		    title: {
		      text: "Nombres de crimes"
		    }
		  }
		};

		var barChart = new ApexCharts(document.querySelector("#bar-chart2"), barChartOptions);
		barChart.render();
var pieChartOptions = {
				  series: [${volTire}, ${volMain}, ${volViol}, ${aggression}, ${assassinat}],
				  chart: {
				    type: 'pie',
				    height: 350,
				    toolbar: {
				      show: false
				    },
				  },
				  labels: ["Vol à la tire", "Vol à main armée", "Vol avec violance", "Aggression", "Assassinat"],
				  colors: [
				    "cadetblue",
				    "pink",
				    "#4f35a1",
				    "red",
				    "black"    
				  ],
				  plotOptions: {
				    pie: {
				      donut: {
				        size: '50%'
				      }
				    }
				  },
				  legend: {
				    show: true,
				    position: 'right',
				  },
				  dataLabels: {
				    enabled: false
				  },
				};

var pieChart = new ApexCharts(document.querySelector("#pie-chart"), pieChartOptions);
				pieChart.render();
		
var barChartOptions = {
  series: [{
    data: [${NumChartsTTAH}, ${NumChartsRSK}, ${NumChartsOR}, ${NumChartsFM}, ${NumChartsBMK},${NumChartsCS} , ${NumChartsMRS},${NumChartsDT} ,${NumChartsSM} ,${NumChartsGON} ,${NumChartsLSH} ,${NumChartsDOED} ] 
 

  }],
  chart: {
    type: 'bar',
    height: 350,
    toolbar: {
      show: false
    },
  },
  colors: [
    "#246dec",
    "#cc3c43",
    "#367952",
    "#4f35a1",
    "#4f35a1",
    "cadetblue",
    "yellow",
    "red",  
    "orange",
    "silver",
    "green",
    "blue"     
  ],
  plotOptions: {
    bar: {
      distributed: true,
      borderRadius: 4,
      horizontal: false,
      columnWidth: '55%',
    }
  },
  dataLabels: {
    enabled: false
  },
  legend: {
    show: false
  },
  xaxis: {
    categories: ["Tanger-Tétouan-Al Hoceima", "Rabat-Salé-Kénitra", "L'Oriental", "Fès-Meknès", "Beni Mellal-Khénifra","Casablanca-Settat","Marrakech-Safi","Drâa-Tafilalet","Souss-Massa","Guelmim-Oued Noun","Laâyoune-Sakia El Hamra","Dakhla-Oued Ed Dahab"],
  },
  yaxis: {
    title: {
      text: "Nombre de plaintes"
    }
  }
};

var barChart = new ApexCharts(document.querySelector("#bar-chart"), barChartOptions);
barChart.render();



// AREA CHART
var areaChartOptions = {
  series: [{
    name: 'Crimes',
    data: [${NumCrimes17},${NumCrimes18}, ${NumCrimes19},${NumCrimes20},${NumCrimes21},${NumCrimes22},${NumCrimes23}]
  }, {
    name: 'Personnes disparues',
    data: [${NumPd17},${NumPd18},${NumPd18},${NumPd19},${NumPd20},${NumPd21},${NumPd22}]
  }],
  chart: {
    height: 350,
    type: 'area',
    toolbar: {
      show: false,
    },
  },
  colors: ["#4f35a1", "#246dec"],
  dataLabels: {
    enabled: false,
  },
  stroke: {
    curve: 'smooth'
  },
  labels: ["2017", "2018", "2019", "2020", "2021", "2022", "2023"],
  markers: {
    size: 0
  },
  yaxis: [
    {
      title: {
        text: 'Crimes',
      },
    },
    {
      opposite: true,
      title: {
        text: 'Personnes disparues',
      },
    },
  ],
  tooltip: {
    shared: true,
    intersect: false,
  }
};

var areaChart = new ApexCharts(document.querySelector("#area-chart"), areaChartOptions);
areaChart.render();</script>
  </body>
</html>
