<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head>
<body>
<div class="contenuu">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <c:forEach items = "${listplainte}" var="plain" varStatus="status">    
        <c:if test="${status.first}">
          <li data-target="#myCarousel" data-slide-to="${status.count-1}" class="active"></li>
        </c:if>
        <c:if test="${!status.first}">
          <li data-target="#myCarousel" data-slide-to="${status.count-1}"></li>
        </c:if>
      </c:forEach>
    </ol>
    <div class="carousel-inner">
      <c:forEach items = "${listplainte}" var="plain" varStatus="status"> 
        <c:if test="${status.first}">
          <div class="item active">
            <%@include file="/WEB-INF/dashUser/helpersU/carousPlaintePD.jsp" %>        
          </div>
        </c:if>
        <c:if test="${!status.first}">
          <div class="item">
            <%@include file="/WEB-INF/dashUser/helpersU/carousPlaintePD.jsp" %>        
          </div>
        </c:if>
      </c:forEach>
    </div>
    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  
</div>
</body>
</html>
<style>
div.contenuu
{
    width:auto;
    height:auto;
    margin-left:10px;/*auto*/
    margin-top:-570px;
    margin-bottom:100px;
    margin-right:540px;
}
.carousel,.carousel-control
{
    background-color:#EBF4FA;
    
}
</style>