<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AlloPolice</title>
		<%@include file="/WEB-INF/dashUser/helpersU/headerUser.jsp" %>
	<style>
div.contenu
{
    width:auto;
    height:auto;
    margin-left:100px;/*10*/
    margin-top:25px;
    margin-bottom:100px;
    margin-right:540px;
}
.hamburger h1,.hamburger h2,.hamburger h3
{
    margin-left:100px;/*10*/	
  	padding: 25px 0;
  	font-size: 22px;
  	font-weight:500;
  	color: #666666;
  	font-family: "Montserrat", sans-serif;
}
.hamburger h1
{
	margin-top:40px;
  	border-bottom: 1px solid #ebebeb;
	
}
.hamburger h2
{
  	font-family: "Montserrat", sans-serif;
	font-size:21px;
	margin-top:-280px;
  	border-bottom: 1px solid #ebebeb;
}
.hamburger h3
{
	margin-top:0;
}
.carousel,.carousel-control
{
    background-color:#EBF4FA;
    width:auto;
}
</style>	
</head>
<body>
	<div class="hamburger">
		<h1>Mes plaintes pour des personnes disparues</h1>
				<%@include file="/WEB-INF/dashUser/helpersU/archivePlaintePdSlider.jsp" %>  
			<div class="side" style="margin-top:-640px"><%@include file="/WEB-INF/helpers/sideMenu.jsp" %></div>					
		<h2>Mes plaintes pour des personnes recherchées</h2>
				<%@include file="/WEB-INF/dashUser/helpersU/multiCardSliderPlaintePr.jsp" %>  
			<h3>Mes témoignages</h3>
				<%@include file="/WEB-INF/dashUser/helpersU/multiCarousTemoignage.jsp" %>  
		</div>			
</body>
		<%@include file="/WEB-INF/helpers/footer.jsp" %>        

</html>