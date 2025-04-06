<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page import="com.java.helpers.ImageToBase64"%>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="contain-wm">
<h1 style="margin-left:20px;color:#3f69a8;margin-left:20px;text-decoration:overline;">Dernières personnes disparues</h1>
                 <c:forEach items = "${listpd}" var="personne" varStatus="boucle">
			    <c:set var="currentPlain" value="${personne}"/>
			    <c:set var="pathToPhoto" value="${currentPlain.photos}"/>
			    <c:set var="bs" value="${ImageToBase64.convertToBase64(pathToPhoto)}"/>     
	<div class="galwm">
		<div class="image-wm" ><c:if test="${not empty bs}"><img src='data:image/jpeg;base64,${bs}'  width="200" height="200"></c:if></div>
		<h1>${personne.getNom()} ${personne.getPrenom() }</h1>
	  <a href="#">Lire la suite <i class="fas fa-angle-right"></i></a>
	</div>
</c:forEach>	
<h1 style="margin-left:20px;color:#3f69a8;text-decoration:overline">Dernières personnes recherchées</h1>
                 <c:forEach items = "${listpr}" var="personne" varStatus="boucle">
			    <c:set var="currentPlain" value="${personne}"/>
			    <c:set var="pathToPhoto" value="${currentPlain.photos}"/>
			    <c:set var="bs" value="${ImageToBase64.convertToBase64(pathToPhoto)}"/>    	
	<div class="galwm">
		<div class="image-wm" ><c:if test="${not empty bs}"><img src='data:image/jpeg;base64,${bs}'  width="200" height="200"></c:if></div>
		<h1>${personne.getFiliationconnue()} ${personne.getCIN_pre() }</h1>
	  <a href="#">Lire la suite <i class="fas fa-angle-right"></i></a>
	</div>
	</c:forEach>
</div>

<style>
div.contain-wm
{
	margin-top:830px;/*830px*/
	margin-bottom:-150px;
	background-color:whitesmoke;
	width:100%;
	height:1199px;
}
div.galwm {
  margin: 35px;
  float: left;
  width: 220px;
 
  /* (A2) HIDE SCROLLBARS */
  overflow: hidden;
  
}
/* (B) INNER WRAPPER */
.image-wm {
  /* (B1) FIT OUTER WRAPPER */
  width: 100%;
  height: 100%;
 
  /* (B2) BACKGROUND IMAGE */
  background-image: url("music.jpg");
  background-position: center;
  background-size: cover;
 
  /* (B3) ANIMATE ZOOM */
  transition: transform ease 0.3s;
}
 
/* (C) ZOOM ON HOVER */
.image-wm:hover { transform: scale(1.2); }
div.galwm a {
  float: left;
  font-size: 16px;
  color: #3f69a8;
  padding: 20px 30px;
  text-decoration: none;
   font-size: 16px;
  
}
div.galwm a:hover,div.galwm h1:hover {
color:blue;
}
div.contain-wm h1,div.galwm h1 {
  cursor:default;
  color: black;
  padding: 20px 30px;
}
div.contain-wm h1
{ 
	margin-top:10px;
	margin-left:-20px;
	font-size:21px;
}
div.galwm h1 {
  text-align: center;
  font-size: 16px;
  text-transform:uppercase;
  
  
}

</style>