<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page import="com.java.helpers.ImageToBase64"%>    

<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
		<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!-- Swiper CSS -->
    	<link rel="stylesheet" href="<%=request.getContextPath()%>/WebRessources/styles/swiper-bundle.min.css">
    	<%@include file="/WEB-INF/dashAdmin/headerAdmin.jsp" %>        

        <!-- CSS -->
<%--     <link rel="stylesheet" href="<%=request.getContextPath()%>/WebRessources/styles/styleSlider.css"> --%>

<style>
@charset "UTF-8";
/* Google Fonts - Poppins */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap');
.ajout
{
  margin-top:-470px;
  display:flex;
  margin-left:270px;
}

.slide-container{
  max-width: 1120px;
  width: 100%;
  padding: 30px 0;
  
  
}
.slide-content{
  margin: 0 40px;
  overflow: hidden;
  border-radius: 25px;
}
.carde{
  border-radius: 25px;
  background-color: whitesmoke;
}
.image-content,
.card-content{
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 10px 14px;
}
.image-content{
  position: relative;
  row-gap: 5px;
  padding: 25px 0;
}
.overlay{
  position: absolute;
  left: 0;
  top: 0;
  height: 100%;
  width: 100%;
  background-color: #9799ab;
  border-radius: 25px 25px 0 25px;
}
.overlay::before,
.overlay::after{
  content: '';
  position: absolute;
  right: 0;
  bottom: -40px;
  height: 40px;
  width: 40px;
  background-color: #9799ab;
}
.overlay::after{
  border-radius: 0 25px 0 0;
  background-color: whitesmoke;
}
.card-image{
  position: relative;
  height: 150px;
  width: 150px;
  border-radius: 50%;
  background:linear-gradient(whitesmoke,#9799ab) ;
  padding: 3px;
}
.card-image .card-img{
  height: 100%;
  width: 100%;
  object-fit: cover;
  border-radius: 50%;
  border: 4px solid #9799ab;
}
.name{
  font-size: 18px;
  font-weight: 500;
  color: #333;
}
.description{
  font-size: 14px;
  color: #707070;
  text-align: center;
}
.button{
  border: none;
  font-size: 16px;
  color: #FFF;
  padding: 8px 16px;
  background-color: #9799ab;
  border-radius: 6px;
  margin: 14px;
  cursor: pointer;
  transition: all 0.3s ease;
}
.button:hover{
  background: #343a40;
  color:white;
  text-decoration:none;
}

.swiper-navBtn{
  color: #6E93f7;
  transition: color 0.3s ease;
}
.swiper-navBtn:hover{
  color: #9799ab;
}
.swiper-navBtn::before,
.swiper-navBtn::after{
  font-size: 35px;
}
.swiper-button-next{
  right: 0;
}
.swiper-button-prev{
  left: 0;
}
.swiper-pagination-bullet{
  background-color: #6E93f7;
  opacity: 1;
}
.swiper-pagination-bullet-active{
  background-color: #9799ab;
}

@media screen and (max-width: 768px) {
  .slide-content{
    margin: 0 10px;
  }
  .swiper-navBtn{
    display: none;
  }
  
}</style>                                        
    </head>
    <body>
    <div class="ajout" id="ajout">
      				<a href="crudPni" class="btn" style="color:white;font-weight:bold;background-color:cadetblue;margin-right:550px"><i class="fas fa-home"></i> <span>Liste principale</span></a>                                      
					<form action="findPni" method="POST" style="display:flex;">
                        <input type="text" class="form-control" style="width:auto" name="search" placeholder="Recherche">
                        <button class="btn" style="color:white;font-weight:bold;background-color:cadetblue;" type="submit"><i class="fas fa-search"></i></button>
                    </form>&nbsp;
					<a href="#addEmployeeModal" class="btn" style="background-color: #9799ab;color:#FFF;"data-toggle="modal"><i class="fas fa-plus-circle"></i> <span>Ajouter</span></a>                    
                    </div>
        <div class="slide-container swiper" id="slider">
            <div class="slide-content">
                <div class="card-wrapper swiper-wrapper">
				<c:forEach items="${listpni}" var="perso" varStatus="status">
			    <c:set var="currentPlain" value="${perso}"/>
			    <c:set var="pathToPhoto" value="${currentPlain.photos}"/>
			    <c:set var="bs" value="${ImageToBase64.convertToBase64(pathToPhoto)}"/>				         
                    <div class="carde swiper-slide">
                        <div class="image-content">
                            <span class="overlay"></span>

                            <div class="card-image">
                                <img src='data:image/jpeg;base64,${bs}'alt="" class="card-img">
                            </div>
                        </div>

                        <div class="card-content">
                            <h2 class="name">Id:${perso.getId_pni() } ${perso.getDate()}-${perso.getLieu()}</h2>
                            <p class="description">Description:${perso.getDescription() }</p>

							<a class="button" href="deletePersonneNonIdentifiee?id_pni=${perso.getId_pni() }" onclick="return confirm('Cette action est irréversible , êtes-vous sûr de bien vouloir supprimer?');"  role="button">Supprimer</a>
                        </div>
                    </div>                
                
                </c:forEach>

                </div>
            </div>

            <div class="swiper-button-next swiper-navBtn"></div>
            <div class="swiper-button-prev swiper-navBtn"></div>
            <div class="swiper-pagination"></div>
        </div>
        	<div id="addEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form method="POST" action="addPersonneNonIdentifiee">
					<div class="modal-header">						
						<h4 class="modal-title">Ajouter une personne non identifiée</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<div class="form-group">
							<label>Date</label>
							<input type="datetime-local" name="date"class="form-control" required>
						</div>
						<div class="form-group">
							<label>Lieu</label>
							<input type="text" class="form-control" name="lieu"  required>
						</div>
						<div class="form-group">
							<label>Description</label>
							<textarea type="text" name="description" class="form-control" required></textarea>
						</div>

						<div class="form-group">
							<label>Photo</label>
							<input type="file"name="photos" class="form-control" >
						</div>					
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary" value="Ajouter">
					</div>
				</form>
			</div>
		</div>
	</div>
    </body>

    <!-- Swiper JS -->
<%--     <link rel="stylesheet" href="<%=request.getContextPath()%>/WebRessources/js/swiper-bundle.min.js"> --%>
<script src="<%=request.getContextPath()%>/WebRessources/js/swiper-bundle.min.js"></script> 
    <!-- JavaScript -->
<%--     <link rel="stylesheet" href="<%=request.getContextPath()%>/WebRessources/js/scriptSlider.js"> --%>
<script src="<%=request.getContextPath()%>/WebRessources/js/scriptSlider.js"></script> 
<script>
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
document.getElementById("slider").style.marginLeft = "350px";
document.getElementById("ajout").style.marginLeft= "400px";
document.getElementById("ajout").style.marginTop= "-450px";
document.body.style.backgroundColor = "#e6e8ed";/*#e6e8ed*/

}

function closeSidebar() {
	
document.getElementById("sidebar").style.width = "0";
document.getElementById("main").style.marginLeft = "0";
document.getElementById("ajout").style.marginLeft= "240px";
document.getElementById("slider").style.marginLeft = "200px";
document.body.style.backgroundColor = "whitesmoke";
}
</script>
</html>