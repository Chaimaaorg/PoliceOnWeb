<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
    <%@include file="/WEB-INF/dashAdmin/headerAdmin.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css?family=Hind:300,400');
*, *:before, *:after {
  -webkit-box-sizing: inherit;
  box-sizing: inherit;
}
.btnDelete
{
	margin-left:1200px;
	border-color:cadetblue;
	top:0;
}
.btnDelete:hover
{
	color:#7288a2;
}
.faqbody {
  margin-top:-400px;
  margin-left:10px;
  font-family: 'Hind', sans-serif;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  min-height: 100vh;
}
.contenufaq {
  margin: 0 auto;
  margin-left:3px;
  margin-top:-80px;
  padding: 4rem;
  width: 1250px;
}

.faqaccordion a {
  position: relative;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
  -ms-flex-direction: column;
  flex-direction: column;
  width: 100%;
  padding: 1rem 3rem 1rem 1rem;
  color: #7288a2;
  font-size: 20px;
  font-weight: 400;
  border-bottom: 1px solid #e5e5e5;
  text-decoration:none;
}
.faqaccordion a:hover,
.faqaccordion a:hover::after {
  cursor: pointer;
  color: #34340a;
  text-decoration:none;
}

.faqaccordion a:hover::after {
  border: 1px solid #34340a;
}
.faqaccordion a.active {
  color: #34340a;
  border-bottom: 1px solid #34340a;
}
.faqaccordion a::after {
  font-family: 'Ionicons';
  content: '\f218';
  position: absolute;
  float: right;
  right: 1rem;
  font-size: 1rem;
  color: #7288a2;
  padding: 5px;
  width: 30px;
  height: 30px;
  -webkit-border-radius: 50%;
  -moz-border-radius: 50%;
  border-radius: 50%;
  border: 1px solid #7288a2;
  text-align: center;
}
.faqaccordion a.active::after {
  font-family: 'Ionicons';
  content: '\f209';
  color: #34340a;
  border: 1px solid #34340a;
}
.faqaccordion .content {
  opacity: 0;
  padding: 0 1rem;
  max-height: 0;
  border-bottom: 1px solid #e5e5e5;
  overflow: hidden;
  clear: both;
  -webkit-transition: all 0.2s ease 0.15s;
  -o-transition: all 0.2s ease 0.15s;
  transition: all 0.2s ease 0.15s;
}
.faqaccordion .content p {
  font-size: 20px;
  font-weight: 300;
}
.faqaccordion .content.active {
  opacity: 1;
  padding: 1rem;
  max-height: 100%;
  -webkit-transition: all 0.35s ease 0.15s;
  -o-transition: all 0.35s ease 0.15s;
  transition: all 0.35s ease 0.15s;
}
</style>  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">          
  <link rel='stylesheet' href='https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/WebRessources/styles/indexCfaq.css" type="text/css">       
</head>
<div class="faqhtml">
	<div class="faqbody">
	<div class="contenufaq" id="idfaq"> 
        <div style="display:inline-block">                
          <p style="font-weight:600;font-family:Montserrat, sans-serif; color: #666666;font-size: 21px;">Questions fréquentes</p>
         		<%@include file="/WEB-INF/dashAdmin/faq/addFaqModal.jsp" %>                
                <a href="faq" style="height:35px;font-size:15px;margin-left:20px;margin-bottom:-40px;color:white;background-color:cadetblue;" class="btn float-left"><i class="fas fa-home"> Accueil</i></a></h2>
                <form method="POST" action="findFaq" class="float-left mb-2 d-flex flex-row" style="margin-left:850px;">
                	<input type="text" name="question" class="form-control" placeholder="Recherche">
                	<button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
                </form>
        </div>
<c:forEach items = "${faqs}" var="user" varStatus="boucle">        
  <div class="faqaccordion">
    <div class="faqaccordion-item">
      <a>${user.getId_faq() }) ${user.getQuestion() } </a>
      <div class="content">
        <p>${user.getReponse() }</p>
      </div>
    </div>
  </div> 
<a href="deleteFaq?id_faq=${user.getId_faq() }" onclick="return confirm('Cette action est irréversible , êtes-vous sûr de bien vouloir supprimer?');"   class="btnDelete"><i class="fas fa-trash"></i></a>      
</c:forEach> 
</div>
</div>
</div>
<script src='https://code.jquery.com/jquery-3.2.1.min.js'></script>
<script>
//Code By Webdevtrick ( https://webdevtrick.com )
const items = document.querySelectorAll(".faqaccordion a");

function toggleAccordion(){
  this.classList.toggle('active');
  this.nextElementSibling.classList.toggle('active');
}

items.forEach(item => item.addEventListener('click', toggleAccordion));
function toggleSidebar() {
	  var sidebar = document.getElementById("sidebar");
	  var main = document.getElementById("main");
	  var tableusers = document.getElementById("tableUsers");
	  var currentWidth = sidebar.style.width;
	  
	  if (currentWidth === "0px" || currentWidth === "") {
	    openSidebar();
	  } else {
	    closeSidebar();
	  }
	}
function openSidebar() {
document.getElementById("sidebar").style.width = "269px";/*269px*/
document.getElementById("main").style.marginLeft = "250px";
document.getElementById("idfaq").style.marginLeft = "250px";
document.body.style.backgroundColor = "#e6e8ed";/*#e6e8ed*/

}

function closeSidebar() {
	
document.getElementById("sidebar").style.width = "0";
document.getElementById("main").style.marginLeft = "0";
document.getElementById("idfaq").style.marginLeft= "0";
document.body.style.backgroundColor = "whitesmoke";
}
</script>
</html>