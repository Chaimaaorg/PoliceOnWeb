<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.java.helpers.ImageToBase64"%>      
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
@charset "UTF-8";
body
{
    background-color:#ebebeb;
}
.border-bottom
{
	  width: 80%;
	  margin-left: auto;
	  margin-top: -20px;
	  margin-right: auto;
	  text-align: center;
	  margin-bottom:50px;
      border-bottom: 1.5px solid #ebebeb;
}
.content {
    width: 1000px;
    margin: 80px auto;
}
.global {
	display:flex;
	
}
.monImage
{
	margin-right:170px;
	margin-left:-200px;	
    margin-top: 240px;    
 	border-radius: 20%;
 	cursor:grab;
    /* (A) OPTIONAL DIMENSIONS */
 
  /* (B) ANIMATE ZOOM */
  /* ease | ease-in | ease-out | linear */
  transition: transform ease-in-out 0.3s;
  
 }
/* (C) ZOOM ON HOVER */
.monImage:hover { transform: scale(1.1); }
/*.monImage{
	margin-right:170px;
	margin-left:-200px;	
    margin-top: 240px;    
 	border-radius: 20%;
}*/
.content h2 {
    margin: 0;
    padding: 15px 0;
    font-size: 24px;
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
.update form input,textarea{
    padding: 10px;
    width: 400px;
    margin-right: 25px;
    margin-bottom: 15px;
    border: 1px solid #cccccc;
}
.update form input[type="submit"],.btn{
    display: inline-block;
    border: 0;
    font-weight: bold;
    font-size: 14px;
    color: #FFFFFF;
    cursor: pointer;
    width: 200px;
  	margin-top: 15px;
}

.update form input[type="submit"]:hover {
    background-color: #343a40;
}
</style>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<%@include file="/WEB-INF/dashUser/helpersU/headerUser.jsp" %>  
<%--     <link rel="stylesheet" href="<%=request.getContextPath()%>/WebRessources/styles/editPr.css"> --%>
</head>
<body>
<c:forEach items = "${listplaintePr}" var="plainte" varStatus="status">
<div class="global" id="global">
<div class="content update">
<c:set var="currentPlain" value="${plainte}"/>
<c:set var="pathToPhoto" value="${currentPlain.photos}"/>
<c:set var="bs" value="${ImageToBase64.convertToBase64(pathToPhoto)}"/>   
	<h2>Mes plaintes contre cette personne:</h2>	
    <form action="editPersonneRecherchee" method="POST">
        <label for="name">Mon CIN :</label>
        <label for="name">Numéro de déclaration</label>        
        <input type="text" name="CIN_pre"  value="${user.getCIN() }" readonly>        
        <input type="text" name="photos"   value="${plainte.getId_plainte_pr() }" readonly>
        <label for="prenom">Lieu des faits</label>
        <label for="job">Date des faits</label>
        <input type="text"  name="filiationconnue"  value="${plainte.getLieuDesFaits() }"    readonly>
        <input type="datetime-local"  name="nationalite"  value="${plainte.getDateDesFaits() }"    readonly>
        <label for="skills">Témoins</label>
        <label for="created">Description</label>
        <input type="text"  name="derniereplaceretr"  value="${plainte.getTémoins() }"    readonly>
		<textarea name="description"  placeholder="${plainte.getDescription() }" readonly></textarea>
        <div class="modal-footer">
	    <a  href = "addPlainte" class="btn btn-primary" style="font-weight:bold;margin-top:3px;height:40px">Ajouter une autre plainte</a>        			 
	    <a  href = "archive" class="btn btn-warning" style="font-weight:bold;margin-top:3px;height:40px">Retour à la liste</a>        			 
        </div>
    </form>
</div>
<div class="monImage" id="globalImg">
    <c:if test="${not empty bs}"><img src='data:image/jpeg;base64,${bs}'  width="250" height="200"></c:if>
</div>
</div>
</c:forEach>
		<div class="border-bottom"></div>
<!-- 		<div class="gall"> -->
<%-- 		<%@include file="/WEB-INF/dashUser/helpersU/galleryUser.jsp" %> --%>
<!-- 		</div> -->
		<%@include file="/WEB-INF/helpers/footer.jsp" %> 

</body>
</html>



