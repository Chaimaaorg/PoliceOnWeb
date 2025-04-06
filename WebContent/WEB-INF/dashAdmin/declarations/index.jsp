<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@page import="com.java.helpers.ImageToBase64"%>      
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    	<%@include file="/WEB-INF/dashAdmin/headerAdmin.jsp" %> 
<style>
@charset "UTF-8";
.declaration
{
	margin-top:-450px;
	margin-left:150px;

}
article
{
	margin-top:70px;
}
article p
{
	width:700px;
}
.column1 {
  margin-left: 155px;
  margin-right: 15px;
  float: left;
}
.image
{
  margin-bottom: 70px;
  margin-top:30px;
  cursor:grab;
  border-radius: 25000px;
    /* (A) OPTIONAL DIMENSIONS */
  width: 100%;
  height: auto;
 
  /* (B) ANIMATE ZOOM */
  /* ease | ease-in | ease-out | linear */
  transition: transform ease-in-out 0.3s;
  
 }
/* (C) ZOOM ON HOVER */
.image:hover { transform: scale(1.1); }
.column2 {
  margin: 28px;
  float: left;
  width: 600px;
  height:100px;
  cursor:grab;
  
}
p:hover { color:lightblue; }
.h22:hover { color:lightblue; }
.h11:hover { color:lightblue; }
div.ahref a{
  float:right;
  font-size: 16px;
  color: #3f69a8;
  padding: 20px 30px;
  text-decoration: none;
}
h1,h2
{
	font-size:21px;
	margin-left:115px;
}
.row
{
	border-bottom:0.5px solid lightgrey;
}
.h22
{
	  font-size: 16px;
	  color: #3f69a8;
	  text-decoration: none;
}
.h11
{
	 margin-top:20px;
	 font-size: 15px;
	 color: gray;
	 text-decoration: none;
}
</style>    	
</head>	
	
<body>
<div class="declaration" id="declaration">
<h1>Déclarations pour des personnes disparues</h1>
                    <form action="findDeclarationPd" method="POST" style="display:flex;margin-top:-35px;margin-left:855px">
                        <input type="text" class="form-control" style="width:40%" name="searchDD" placeholder="Recherche">
                        <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
                    	<a class="btn btn-success" href="desclarationsAdmin" style="margin-left:5px" ><i class="fas fa-home"></i></a>                                            
                    </form>
<div class="row">
<div class="column1">
<c:forEach items = "${listdd}" var="declarationd" varStatus="boucle">
<c:set var="currentPlain" value="${declarationd}"/>
<c:set var="pathToPhoto" value="${currentPlain.photos}"/>
<c:set var="bs" value="${ImageToBase64.convertToBase64(pathToPhoto)}"/>    
<div class="image" ><c:if test="${not empty bs}"><img src='data:image/jpeg;base64,${bs}' alt="Cinque Terre" width="200" height="200" \></c:if></div>		
</c:forEach>
</div>
<div class="column2">
<c:forEach items = "${listdd }" var="declarationd" varStatus="boucle">
<article>
  <div class="h22">Déclaration N:${declarationd.getId_plainte_pd()}</div>
  <div class="h11">${declarationd.getDatedisparition() }-${declarationd.getLieudisparition()}</div>
  <p>L'utilisateur ayant pour CIN ${declarationd.getId_user() } déclare que , M(Me) ${declarationd.getNom() } ${declarationd.getPrenom() } agé de ${declarationd.getAge() } ans a été disparue le ${declarationd.getDatedisparition() } à ${declarationd.getLieudisparition() } , il a pour CIN ${declarationd.getId_pd() }, voici une description détaillée ${declarationd.getDescription() }</p>
<!-- <div class="ahref"><a href="">Lire la suite <i class="fas fa-angle-right"></i></a></div> -->
</article>
&nbsp;&nbsp;
</c:forEach>
</div>
</div>
<h2>Déclarations pour des personnes recherchées</h2>
                    <form action="findDeclarationPr" method="POST" style="display:flex;margin-top:-35px;margin-left:855px">
                        <input type="text" class="form-control" style="width:40%"name="searchDR" placeholder="Recherche">
                        <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
                    	<a class="btn btn-success" href="desclarationsAdmin" style="margin-left:5px" ><i class="fas fa-home"></i></a>                                                                
                    </form>
<div class="column1">
<c:forEach items = "${listdr}" var="declarationr" varStatus="boucle">
<c:set var="currentPlain" value="${declarationr}"/>
<c:set var="pathToPhoto" value="${currentPlain.photos}"/>
<c:set var="bs" value="${ImageToBase64.convertToBase64(pathToPhoto)}"/>    
<div class="image" ><c:if test="${not empty bs}"><img src='data:image/jpeg;base64,${bs}' alt="Cinque Terre" width="200" height="200" \></c:if></div>		
</c:forEach>
</div>
<div class="column2">
<c:forEach items = "${listdr }" var="declarationr" varStatus="boucle">
<article>
  <div class="h22">Déclaration N:${declarationr.getId_plainte_pr()}</div>
  <div class="h11">${declarationr.getDateDesFaits() }-${declarationr.getLieuDesFaits()}</div>
  <p>L'utilisateur ayant pour CIN ${declarationr.getId_pre() } déclare les faits suivants "${declarationr.getDescription() }", il déclare pour témoins ${declarationr.getTémoins() } et assure que l'acteur a pour filiation ${declarationr.getFiliationconnue() }</p>
<!-- <div class="ahref"><a href="#">Lire la suite <i class="fas fa-angle-right"></i></a></div> -->
</article>
&nbsp;&nbsp;
</c:forEach>
</div>
</div>
</body>
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
document.getElementById("declaration").style.marginLeft = "250px";
document.body.style.backgroundColor = "#e6e8ed";/*#e6e8ed*/

}

function closeSidebar() {
	
document.getElementById("sidebar").style.width = "0";
document.getElementById("main").style.marginLeft = "0";
document.getElementById("declaration").style.marginLeft= "150px";
document.body.style.backgroundColor = "whitesmoke";
}
</script>
</html>
