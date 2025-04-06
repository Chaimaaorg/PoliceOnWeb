<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/WebRessources/styles/header.css" type="text/css">
</head>
<body>
<div class="navbarr">
  <img id="img" src="<%=request.getContextPath()%>/WebRessources/images/logo.png" >
  <a href="index"><i class="fas fa-home"></i> Actualités</a>
  <div class="dropdownn">
    <button class="dropbtnn"><i class="fas fa-question-circle"></i> Questions
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-contentt">
      <div class="headerr">
        <h2 style="margin:0%;">Questions</h2>
      </div>  
      <div class="row">
        <div class="column">
          <a href="#">Arnaque</a>
          <a href="#">Coronavirus</a>
          <a href="#">Plaintes</a>
        </div>
        <div class="column">
          <a href="#">Avis de recherche</a>
          <a href="#">Divers</a>
          <a href="#">Prévention</a>
        </div>
        <div class="column">
          <a href="#">Circulation</a>
          <a href="#">Fraude sportive</a>
          <a href="#">Recrutement</a>
        </div>
      </div>
    </div>
  </div>
    <div class="dropdownn">
    <button class="dropbtnn"><i class="fas fa-search"></i> Avis de recherche
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-contentt">
      <div class="headerr">
        <h2 style="margin:0%;">Avis de recherche</h2>
      </div>  
      <div class="row">
        <div class="column">
          <a href="#">Most wanted</a>
          <a href="#">Propriétaires recherchés</a>        
        </div>
        <div class="column">
          <a href="#">Personnes disparues</a>
          <a href="#">Personnes recherchées</a>        
        </div>
        <div class="column">
          <a href="#">Personnes non identifiées</a>
        </div>
      </div>
    </div>
  </div>
    <div class="dropdownn">
    <button class="dropbtnn"><i class="fas fa-info-circle"></i> A propos
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-contentt">
      <div class="headerr">
        <h2 style="margin:0%;">A propos</h2>
      </div>  
      <div class="row">
        <div class="column">
          <h5>Category 1</h5>
          <a href="#">Link 1</a>
          <a href="#">Link 2</a>
          <a href="#">Link 3</a>
        </div>
        <div class="column">
          <h5>Category 2</h5>
          <a href="#">Link 1</a>
          <a href="#">Link 2</a>
          <a href="#">Link 3</a>
        </div>
        <div class="column">
          <h5>Category 3</h5>
          <a href="#">Link 1</a>
          <a href="#">Link 2</a>
          <a href="#">Link 3</a>
        </div>
      </div>
    </div>
  </div>
    <div class="dropdownn">
    <button class="dropbtnn"><i class="fas fa-handshake"></i> Contact
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-contentt">
      <div class="headerr">
        <h2 style="margin:0%;">Contact</h2>
      </div>  
      <div class="row">
        <div class="column">
          <a href="#">Numéros d'urgence</a>          
        </div>
        <div class="column">
          <a href="indexTest/login.jsp">Formulaire de contact</a>
        </div>
        <div class="column">
          <a href="#">Formulaire de plainte</a>          
        </div>        
      </div>
    </div>
  </div>
  
  <%@include file="/WEB-INF/jsp/loginModal.jsp" %> 
         
   
</div>
</body>
</html>

<style>
@import url('https://fonts.googleapis.com/css2?family=Audiowide&family=Open+Sans:wght@300;400;600;700;800&family=Roboto:ital,wght@0,100;0,900;1,900&display=swap');  * 
{
    box-sizing: border-box;
    font-family: -apple-system, BlinkMacSystemFont, "segoe ui", roboto, oxygen, ubuntu, cantarell, "fira sans", "droid sans", "helvetica neue", Arial, sans-serif;
    font-size: 16px;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
body {
  margin: 0;
}
.navbarr {
  overflow: hidden;
  background-color: #343a40;
  font-family: Arial, Helvetica, sans-serif;
  font-weight:bold;
  font:bold;
  height: 60px;
  width: 100%;
  border: 0;
  display:block;
/*   pour fixer le navbar au top   
   top:0;  
   position:fixed; */
  

}
div.navbarr a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 20px 80px -10px;
  margin-left:210px;
  text-decoration: none;
}

#img {
  margin-top:8px;
  margin-left:-990px;
  width:10%;
  height:40px;
}


.dropdownn {
  float: left;
  overflow: hidden;
  padding: 6px;
 
}

.dropdownn .dropbtnn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font: inherit;
  margin: 0;
}

.navbarr a:hover, .dropdownn:hover .dropbtnn {
    color: #6381A8;
    cursor:pointer;
}

.dropdown-contentt {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  width: 100%;
  left: 0;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-contentt .headerr {
  background: #6381A8;
  padding: 16px;
  color: white;
}

.dropdownn:hover .dropdown-contentt {
  display: block;
}

/* Create three equal columns that floats next to each other */
.dropdown-contentt .column {
  float: left;
  width: 33.33%;
  padding: 10px;
  background-color: #ccc;
  height: 300px;
}

.dropdown-contentt .column a {
  float: none;
  color: black;
  margin-left:10px;
  padding: 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-contentt .column a:hover {
  background-color: #ddd;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .dropdown-contentt .column {
    width: 100%;
    height: auto;
  }
}</style>
<script>
const inputs = document.querySelectorAll(".input");


function addcl(){
	let parent = this.parentNode.parentNode;
	parent.classList.add("focus");
}

function remcl(){
	let parent = this.parentNode.parentNode;
	if(this.value == ""){
		parent.classList.remove("focus");
	}
}


inputs.forEach(input => {
	input.addEventListener("focus", addcl);
	input.addEventListener("blur", remcl);
});
</script>