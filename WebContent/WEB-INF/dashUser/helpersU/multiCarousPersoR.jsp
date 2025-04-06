<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>
    <%@page import="com.java.helpers.ImageToBase64"%>    

<div class="row">
<c:forEach items="${listperso}" var="perso" varStatus="status">         
    <c:set var="currentPlain" value="${perso}"/>
    <c:set var="pathToPhoto" value="${currentPlain.photos}"/>
    <c:set var="bs" value="${ImageToBase64.convertToBase64(pathToPhoto)}"/>
	<div class="col-sm-3" style="margin-left:15px;">
	<div class="card card-block">
	  <img class="card-img-top" alt="100%x280" src='data:image/jpeg;base64,${bs}' data-holder-rendered="true" style="height: 190px; width: 100%; display: block;">
	  <div class="card-block">
	    <h4 class="card-title" style="text-transform:uppercase;font-weight:bold;font-family:Montserrat, sans-serif;">CIN:${perso.getCIN_pre() }/Filiation connue:${perso.getFiliationconnue() }</h4>
	    <p class="card-text" style="font-weight:350;color:black;font-size:18px;">Description:${perso.getDescription() },Nationalité: ${perso.getNationalite() },Dernière place connue:${perso.getDerniereplaceretr() }</p>
	    <a href="allPlaintePrUser?id_pre=${perso.getCIN_pre() }" class="btn " style="float:right;background-color:#EBF4FA"><i class="fas fa-eye"></i> Voir plus de détails</a>
	  </div>
	  </div>
	</div>
</c:forEach> 
	</div>