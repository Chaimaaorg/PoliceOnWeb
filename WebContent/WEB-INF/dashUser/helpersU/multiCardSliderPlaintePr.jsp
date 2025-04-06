<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.card
{
	box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
	border-radius: 15px 15px 30px 5px;
}
div.card:hover{
  border: 1px solid #0bc3ec;

}
.card-block
{
	width:360px;
	height:350px;
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
</head>
<body>
<div class="row">
<c:forEach items="${listperso}" var="perso" varStatus="status"> 
    <c:set var="currentPlain" value="${perso}"/>
    <c:set var="pathToPhoto" value="${currentPlain.photos}"/>
    <c:set var="bs" value="${ImageToBase64.convertToBase64(pathToPhoto)}"/>        
<div class="col-sm-3" style="margin-left:15px;">
<div class="card card-block">
	  <img class="card-img-top" alt="100%x280" src='data:image/jpeg;base64,${bs}' data-holder-rendered="true" style="height: 190px; width: 100%; display: block;">
  <div class="card-block">
    <h4 class="card-title" style="margin-left:10px;text-align:center;text-transform:capitalize;font-size:17px;font-weight:bold;color:#6282ab">CIN:${perso.getCIN_pre() }/Filiation connue:${perso.getFiliationconnue() }</h4>
    <p class="card-text" style="text-align:center;font-weight:350;color:black;font-size:18px;">Description:${perso.getDescription() },Nationalité: ${perso.getNationalite() },Dernière place connue:${perso.getDerniereplaceretr() }</p>
  </div>
  </div>
</div>
</c:forEach>
</div>
</body>
</html>