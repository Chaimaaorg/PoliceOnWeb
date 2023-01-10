<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.java.helpers.ImageToBase64"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Personnes disparues</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/WebRessources/styles/gallery.css" type="text/css">
<style>
@charset "UTF-8";
form
{
	display:flex;
	margin-top:50px;
	margin-left:1100px;
}


img
{
  margin-left:auto;
  width:150px;
  height:150px;
}
 div.contain-gallery{
 	margin-top:30px; 
	margin-left:80px; 
	margin-bottom:1000px; /*500px*/
} 
div.gallery {
  margin: 10px;
  float: left;
  width: 320px;
  background-color:white;
  border: 0.3px solid lightgrey;  
  border-radius: 15px 15px 30px 5px;
  box-shadow: 10px 10px 10px whitesmoke;
  
  
}
div.gallery a,div.gallery btn{
  float: left;
  font-size: 16px;
  color: #3f69a8;
  padding: 20px 30px;
  text-decoration: none;
   font-size: 16px;
  
}
div.gallery h1 {
  font-size: 16px;
  cursor:default;
  color: #3f69a8;
  text-align: center;
  padding: 20px 30px;
  text-decoration: none;
}
div.gallery:hover{
  border: 1px solid #0bc3ec;

}

div.desc {
  width: 320px;
  margin-left:2px;
  cursor:default;
  padding:25px 0;
  text-align: center;
  align-items:center;
}</style>
</head>
<div class="bb" style=" position: fixed; top: 0; left: 0width: 100%;z-index: 999;">
	<%@include file="/WEB-INF/helpers/header.jsp" %>        
</div>
<body>
<div class="aa" style="margin-top:50px;width:auto;">
		<%@include file="/WEB-INF/helpers/carousel.jsp" %> 
	 </div>
     <a href="allPrVisiteur" style="height:35px;width:10%;font-size:15px;margin-left:940px;margin-bottom:-142px"class="btn btn-warning"><i class="fas fa-home"> Accueil</i></a> 
	 <form action="findPrVisiteur" method="POST" >
	 <input type="text" class="form-control" name="search" placeholder="Recherche">
	 <button class="btn btn-primary" type="submit" style="width:10%;margin-top:-10px;"><i class="fas fa-search"></i></button>
	 </form>	 
<div class="contain-gallery">
<c:forEach items = "${listpr}" var="personne" varStatus="boucle">
    <c:set var="currentPlain" value="${personne}"/>
    <c:set var="pathToPhoto" value="${currentPlain.photos}"/>
    <c:set var="bs" value="${ImageToBase64.convertToBase64(pathToPhoto)}"/>
	<div class="gallery">
		<h1><c:if test="${not empty bs}"><img src='data:image/jpeg;base64,${bs}'></c:if><br><br>${personne.getCIN_pre() } ${personne.getFiliationconnue() }-${personne.getNationalite() }</h1>
	  <div class="desc">Dernière place retrouvée ${personne.getDerniereplaceretr() } ${personne.getDescription() }</div>
	  <a href="temoignage?id=${personne.getCIN_pre() }">Faire un  témoignage <i class="fas fa-angle-right"></i></a>
	</div>
	</c:forEach>
</div>
</body>
	<%@include file="/WEB-INF/helpers/footer.jsp" %>  
	<script src="//code.tidio.co/t3ldv3d3us4al3ysr65yzegetfe25blr.js" async></script>	      
</html>