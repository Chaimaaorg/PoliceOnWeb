<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page import="com.java.helpers.ImageToBase64"%>    
<%@ page contentType="text/html; charset=UTF-8" %>
<style>
.card
{
	box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
	border-radius: 15px 15px 30px 5px;
	margin-bottom:10px;
}
div.card:hover{
  border: 1px solid #0bc3ec;

}
.card-block
{
	width:360px;
	height:310px;
}
.card-block
{
	cursor:grab;
    /* (A) OPTIONAL DIMENSIONS */
 
  	/* (B) ANIMATE ZOOM */
  	/* ease | ease-in | ease-out | linear */
  	transition: transform ease-in-out 0.3s;
}
/* (C) ZOOM ON HOVER */
.card-block:hover { transform: scale(0.8); }
</style>
<div class="row">
<c:forEach items="${listm}" var="perso" varStatus="status"> 
<c:if test="${perso.getTypet() }=='Personne disparue'">
<c:forEach items="${listpd}" var="personne" varStatus="status"> 
<c:if test="${perso.getId_concerne()}==${perso.getId_pd()}">
    <c:set var="currentPlain" value="${perso}"/>
    <c:set var="pathToPhoto" value="${currentPlain.photos}"/>
    <c:set var="bs" value="${ImageToBase64.convertToBase64(pathToPhoto)}"/>
</c:if>
</c:forEach>
</c:if>      
	<div class="col-sm-3" style="margin-left:15px;">
	<div class="card card-block">
	  <img class="card-img-top" alt="100%x280" src='data:image/jpeg;base64,${bs}' data-holder-rendered="true" style="height: 190px; width: 100%; display: block;">
	  <div class="card-block">
	    <h4 class="card-title" style="margin-left:10px;text-align:center;text-transform:capitalize;font-size:17px;font-weight:bold;color:#6282ab">${perso.getDescription() }</h4>
	    <p class="card-text" style="font-weight:350;color:black;font-size:18px;">Témoignage pour une:${perso.getTypet() }</p>
	  </div>
	  </div>
	</div>
</c:forEach> 
	</div>