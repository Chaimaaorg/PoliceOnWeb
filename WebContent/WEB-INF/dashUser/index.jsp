<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AlloPolice</title>
		<%@include file="/WEB-INF/dashUser/helpersU/headerUser.jsp" %>        
<style>
.border-bottom {
  width: 80%;
  margin-left: auto;
  margin-top: -150px;
  margin-right: auto;
  text-align: center;
  margin-bottom:50px;
  border-bottom: 1.5px solid #ebebeb;
}
.space-bottom {
  margin-bottom:100px;
}
</style>		
</head>
<body>		
		<div style="">
		<%@include file="/WEB-INF/helpers/carousel.jsp" %> 
		</div> 
		<%@include file="/WEB-INF/dashUser/helpersU/formInfoModif.jsp"%>                    
		<div class="aa" style="margin-left:-100px;margin-top:-580px"><%@include file="/WEB-INF/dashUser/helpersU/indexPlaintePdSlider.jsp" %></div>  
		<div class="border-bottom"></div>              
		<%@include file="/WEB-INF/dashUser/helpersU/galleryUser.jsp" %> 
		<div class="space-bottom"></div>


</body>

		<%@include file="/WEB-INF/helpers/footer.jsp" %>        
</html>
<style>
body
{
	background:#FFF;
}
</style>