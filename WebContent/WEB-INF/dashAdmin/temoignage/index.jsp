<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  	<%@include file="/WEB-INF/dashAdmin/headerAdmin.jsp" %>          
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">


		<link rel="stylesheet" href="<%=request.getContextPath()%>/WebRessources/styles/indexCuser.css" type="text/css">       
</head>
<body>
<div class="section" id="tableUsers">
    <div class="row my-5">
        <div class="col-md-13 mx-auto">
                <a href="dashAdmin" style="margin-left:20px;margin-bottom:-40px;color:cadetblue;border-color:cadetblue;" class="btn float-left"><i class="fas fa-home"> Accueil </i></a></h2>
                <a href="temoignageAdmin" style="margin-left:20px;margin-bottom:-40px;color:cadetblue;border-color:cadetblue;" class="btn float-left"><i class="fas fa-list"> Liste principale </i></a></h2>                
                    <form action="findTemoignage" method="POST" class="float-left mb-2 d-flex flex-row" style="margin-left:1000px;">
                        <input type="text" name="search" placeholder="Recherche">
                        <button class="btn btn-sm" style="background-color:cadetblue" type="submit"><i class="fas fa-search"></i></button>
                    </form>
                <table class="table table-hover">
                <thead>
                    <tr>
                    <th scope="col">Témoignage N°</th>
                    <th scope="col">CIN utilisateur</th>
                    <th scope="col">Témoignage pour</th>
                    <th scope="col">Identifiant de la personne concernée</th>
                    <th scope="col">Description</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items = "${listtm}" var="user" varStatus="boucle">
                        <tr>
                        <th>${user.getId_temoignage() }</th>  
                        <th>${user.getId_user() }</th>
                        <th>${user.getTypet() }</th>
                        <th scope="row">${user.getId_concerne() }</th>
                        <th>${user.getDescription() }</th>
                            </c:forEach>
                    </tr>
                </tbody>
                </table>   
        </div>
    </div>
</div>
</body>
</html>
 <style>
.section
{
	  margin-top: -450px;
	  margin-left:100px;
	  margin-right:20px;
	  width:auto;
	  height:100%;
	  max-width:100%;
	  color:transparent;
	  font-family: "Montserrat", sans-serif;
	  font-weight:normal;
	  font-size:15px;
	  
	  
}
    .table 
    {
        width:1300px;
        color:#9799ab;
    }
    .img-avatar{
        width:55px;
        height:55px;
        object-fit:cover;
        object-position:center center;
        border-radius:100%;
    }
</style>
<%--     <script src="<%=request.getContextPath()%>/WebRessources/js/dashAdmin.js"> --%>
<script>
  //SIDEBAR TOGGLE

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
      document.getElementById("tableUsers").style.marginLeft = "269px";
      document.body.style.backgroundColor = "whitesmoke";/*#e6e8ed*/

      
    }

    function closeSidebar() {
      document.getElementById("sidebar").style.width = "0";
      document.getElementById("main").style.marginLeft= "0";
      document.getElementById("tableUsers").style.marginLeft = "90px";
      document.body.style.backgroundColor = "white";
    }
</script>
 