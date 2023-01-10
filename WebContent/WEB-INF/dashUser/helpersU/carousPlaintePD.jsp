<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.java.helpers.ImageToBase64"%>    
<!DOCTYPE html>
<html>
<head>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/WebRessources/styles/carousPlainte.css" type="text/css">
</head>
<body>
<%--      <c:forEach items = "${listplainte}" var="plain" varStatus="status"> --%>
    <c:set var="currentPlain" value="${plain}"/>
    <c:set var="pathToPhoto" value="${currentPlain.photos}"/>
    <c:set var="bs" value="${ImageToBase64.convertToBase64(pathToPhoto)}"/>
<div id="containerr">	
	
	<div class="product-details">
		
	<h1>Plaintes personnes disparues:</h1>
			<p class="information">CIN:${plain.getCIN_pd() }</p>
			<p class="information">Nom:${plain.getNom() }</p>
			<p class="information">Prenom:${plain.getPrenom() }</p>
			<p class="information">Date de disparition:${plain.getDatedisparition() }</p>
			<p class="information">Lieu de disparition:${plain.getLieudisparition() }</p>
			<p class="information">Description:${plain.getDescription()}</p>
				
	</div>
	
	<div class="product-image">
	
	
	    <img src='data:image/jpeg;base64,${bs}' >
		
	
	</div>

</div>
<%--  </c:forEach> --%>
</body>
</html>