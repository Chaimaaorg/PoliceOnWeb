<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.java.helpers.ImageToBase64"%>    
<c:set var="currentPlain" value="${personneD}"/>
<c:set var="pathToPhoto" value="${currentPlain.photos}"/>
<c:set var="bs" value="${ImageToBase64.convertToBase64(pathToPhoto)}"/>     
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
@charset "UTF-8";
.content {
    width: 1000px;
    margin: -480px auto;
}
.global {
	display:flex;
	
}
.monImage{
	margin-right:170px;
	margin-left:-200px;	
    margin-top: -320px;    
  border-radius: 20%;
}
.content h2 {
    margin: 0;
    padding: 25px 0;
    font-size: 22px;
    border-bottom: 1px solid #ebebeb;
    color: #666666;
}
.update form {
    padding: 15px 0;
    display: flex;
    flex-flow: wrap;
}
.update form label{
    display: inline-flex;
    width: 400px;
    padding: 10px 0;
    margin-right: 25px;
}
.update form input,.update form textarea{
    padding: 10px;
    width: 400px;
    margin-right: 25px;
    margin-bottom: 15px;
    border: 1px solid #cccccc;
}
.update form input[type="submit"]{
    display: inline-block;
    border: 0;
    font-weight: bold;
    font-size: 14px;
    color: #FFFFFF;
    cursor: pointer;
    width: 200px;
  	margin-top: 15px;
}

.update form input[type="submit"]:hover,.btn:hover {
    background-color: #343a40;
}</style>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<%@include file="/WEB-INF/dashAdmin/headerAdmin.jsp" %>  
<%--     <link rel="stylesheet" href="<%=request.getContextPath()%>/WebRessources/styles/editPr.css"> --%>
</head>
<body>
<div class="global" id="global">
<div class="content update">
	<h2>Modifier les informations de la personne recherchée</h2>	
    <form action="editPersonneDisparue" method="POST">
        <label for="name">CIN de la personne ou l'un des proches :</label>
        <label for="name">Importer une nouvelle photo</label>        
        <input type="text" name="CIN_pd"  value="${personneD.getCIN_pd() }" readonly>        
        <input type="file" name="photos"   value="${personneD.getPhotos() }" required>
        <label for="prenom">Nom</label>
        <label for="job">Prénom</label>
        <input type="text" name="prenom"  value="${personneD.getNom() }"    required>
        <input type="text" name="nom"  value="${personneD.getPrenom() }"    required>
        <label for="skills">Description</label>
        <label for="created">Age</label>
        <textarea type="text" name="description"  placeholder="${personneD.getDescription() }"  required></textarea>
		<input name="age"  value="${personneD.getAge() }"required>
        <label for="prenom">Date de disparition</label>
        <label for="job">Lieu de disparition</label>
        <input type="datetime-local" name="datedisparition"  value="${personneD.getDatedisparition() }"    required>
        <input type="text" name="lieudisparition"  value="${personneD.getLieudisparition() }"    required>        
        <div class="modal-footer">
        <input type="submit" class="btn btn-primary" value='Modifier'>	
	    <a  href = "crudPd" class="btn btn-warning btn-outline-secondary">Annuler</a>        			 
        </div>
    </form>
</div>
<div class="monImage" id="globalImg">
    <c:if test="${not empty bs}"><img src='data:image/jpeg;base64,${bs}'  width="250" height="200"></c:if>

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
document.getElementById("global").style.marginLeft = "250px";
document.getElementById("globalImg").style.marginRight= "30px";
document.body.style.backgroundColor = "#e6e8ed";/*#e6e8ed*/

}

function closeSidebar() {
	
document.getElementById("sidebar").style.width = "0";
document.getElementById("main").style.marginLeft = "0";
document.getElementById("global").style.marginLeft = "5px";
document.getElementById("globalImg").style.marginRight= "100px";
document.body.style.backgroundColor = "whitesmoke";
}
</script>
</html>

