<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
  <div class="box" style="margin-top:-50px"><!---50px-->
  <a class="button" href="#popup1"><i class='fa fa-sign-in'></i>&nbsp;&nbsp;Se connecter</a>
  </div>
   <div id="popup1" class="overlay">
	<div class="popup">
		
		<a class="close" href="#">&times;</a>
		<div class="containerr" style="width:50%;height:50%;margin-top:5%;">
		<div class="login-content">
			<form action="LoginServlet" method="POST">
				
				<h2 class="title">Bienvenue</h2>
        
           		<div class="input-div one">
           		   <div class="i">
           		   		<i class="fas fa-user"></i>
           		   </div>
           		   <div class="div">
           		   		
           		   		<input type="text" name="email" class="input" placeholder="Email">
           		   </div>
           		</div>
           		<div class="input-div pass">
           		   <div class="i"> 
           		    	<i class="fas fa-lock"></i>
           		   </div>
           		   <div class="div">
           		    	
           		    	<input type="password" name="mdp" class="input" placeholder="Password">
            	   </div>
            	</div>
            	
            	<input type="submit" name="submit" class="btn" value="Login">
            	<a href="registerServlet" id="register">Vous n'avez pas de compte? <span style="text-decoration-line: underline;color:#6578fd">Inscrivez-vous</span></a>
            </form>
      <script type="text/javascript" src="js/main.js"></script>
    </div>

			</div>
	</div>
</div>
</body>
</html>
<style>
    .containerr{
    width: 100vw;
    height: 100vh;
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    grid-gap :7rem;
    padding: 0 2rem;
    margin-top:0%;
    margin-left:20%;
}



.login-content{
	display: flex;
	justify-content: flex-start;
	align-items: center;
	text-align: center;
}


form{
	width: 360px;
}

.login-content img{
    height: 100px;
}

.login-content h2{
	margin: 15px 0;
	color: #343a60;
	text-transform: uppercase;
	font-size: 2.9rem;
}

.login-content .input-div{
	position: relative;
    display: grid;
    grid-template-columns: 7% 93%;
    margin: 25px 0;
    padding: 5px 0;
    border-bottom: 2px solid #343a60;
}

.login-content .input-div.one{
	margin-top: 0;
}

.i{
	color: #343a60;
	display: flex;
	justify-content: center;
	align-items: center;
}

.i i{
	transition: .3s;
}

.input-div > div{
    position: relative;
	height: 45px;
}

.input-div > div > h5{
	position: absolute;
	left: 10px;
	top: 20%;
	transform: translateY(-50%);
	color: transparent;
	font-size: 18px;
	transition: .3s;
}

.input-div:before, .input-div:after{
	content: '';
	position: absolute;
	bottom: -2px;
	width: 0%;
	height: 2px;
	background-color: white;
	transition: .4s;
}

.input-div:before{
	right: 50%;
}

.input-div:after{
	left: 50%;
}

.input-div.focus:before, .input-div.focus:after{
	width: 50%;
}

.input-div.focus > div > h5{
	top: -5px;
	font-size: 15px;
}

.input-div.focus > .i > i{
	color: white;
}

.input-div > div > input{
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	border: none;
	outline: none;
	background: none;
	padding: 0.5rem 0.7rem;
	font-size: 1.2rem;
	color: #555;
	font-family: 'poppins', sans-serif;
}

.input-div.pass{
	margin-bottom: 4px;
}

a{
	display: block;
	text-align: right;
	text-decoration: none;
	color: #999;
	font-size: 0.9rem;
	transition: .3s;
}

a:hover{
	color: #d3be38;
}

.btn{
	display: block;
	width: 100%;
	height: 50px;
	border-radius: 25px;
	outline: none;
	border: none;
	background-image: linear-gradient(to right, #343a60, #6578fd, blue);
	background-size: 200%;
	font-size: 1.2rem;
	color: #fff;
	font-family: 'Poppins', sans-serif;
	text-transform: uppercase;
	margin: 1rem 0;
	cursor: pointer;
	transition: .5s;
}
.btn:hover{
	background-position: right;
}
.overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
  visibility: hidden;
  opacity: 0;
}
.overlay:target {
  visibility: visible;
  opacity: 1;
}

.popup {
  margin: 70px auto;
  padding: 20px;
  background: #c6cdf4;
  border-radius: 5px;
  width: 50%;
  height:60%;
  transition: all 5s ease-in-out;
  position: relative;
}

.popup h2 {
  margin-top: 0;
  color: #333;
  font-family: Tahoma, Arial, sans-serif;
}
.popup .close {
  position: absolute;
  top: 20px;
  right: 30px;
  transition: all 200ms;
  font-size: 30px;
  font-weight: bold;
  text-decoration: none;
  color: #333;
}
.popup .close:hover {
color:white}
.popup .content {
  max-height: 30%;
  overflow: auto;
}
#register {
  font-size: 16px;
  color: #343a40;
  text-align: center;
  padding: 20px 80px -10px;
  margin-left:0px;
  border-bottom:1px lightgrey;
}
#register:hover 
{
   color:white;
}
@media screen and (max-width: 700px){
  .box{
    width: 70%;
    
  }
  .popup{
    width: 70%;
  }
}
</style>
<!-- /WEB-INF/jsp/login.jsp -->
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<!--     <img src="https://th.bing.com/th/id/R.85b6f12471097f22dd960f5c781efa9f?rik=BJx2n50tMs29hA&pid=ImgRaw&r=0" style="height:70%;width:1600px;margin-top:30%;margin-left:-100%;"> -->
<%--              		<%@include file="/WEB-INF/helpers/header.jsp" %>         --%>

<!-- 	<!DOCTYPE html> -->
<!-- <html> -->

<!-- <head> -->
<!-- 	<title>Se connecter</title> -->
<!-- 	<link rel="stylesheet" type="text/css" href="css/style.css"> -->
<!-- 	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet"> -->
<!-- 	<script src="https://kit.fontawesome.com/a81368914c.js"></script> -->
<!-- 	<meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- </head> -->
<!-- <body> -->
	
<!-- 	<div class="container"> -->
		
<!-- 		<div class="login-content"> -->
<!-- 			<form  method="POST"> -->
				
<!-- 				<h2 class="title">Bienvenue</h2> -->
        
<!--            		<div class="input-div one"> -->
<!--            		   <div class="i"> -->
<!--            		   		<i class="fas fa-user"></i> -->
<!--            		   </div> -->
<!--            		   <div class="div"> -->
<!--            		   		<h5>Email</h5> -->
<!--            		   		<input type="text" name="email" class="input"> -->
<!--            		   </div> -->
<!--            		</div> -->
<!--            		<div class="input-div pass"> -->
<!--            		   <div class="i">  -->
<!--            		    	<i class="fas fa-lock"></i> -->
<!--            		   </div> -->
<!--            		   <div class="div"> -->
<!--            		    	<h5>Password</h5> -->
<!--            		    	<input type="password" name="password" class="input"> -->
<!--             	   </div> -->
<!--             	</div> -->
            	
<!--             	<input type="submit" name="submit" class="btn" value="Login"> -->
<!--             </form> -->
<!--         </div> -->
<!--     </div> -->
<!--     <script type="text/javascript" src="js/main.js"></script> -->
<!-- </body> -->
<!-- </html> -->
	

<style>
 *{
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

body{
    font-family: 'Poppins', sans-serif;
    overflow: hidden;
	margin-left: 50%;
}



.container{
    width: 100vw;
    height: 100vh;
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    grid-gap :7rem;
    padding: 0 2rem;
    margin-left:0%;
    margin-top:-100%;
}



.login-content{
	display: flex;
	justify-content: flex-start;
	align-items: center;
	text-align: center;
}


form{
	width: 360px;
}

.login-content img{
    height: 100px;
}

.login-content h2{
	margin: 15px 0;
	color: #333;
	text-transform: uppercase;
	font-size: 2.9rem;
}

.login-content .input-div{
	position: relative;
    display: grid;
    grid-template-columns: 7% 93%;
    margin: 25px 0;
    padding: 5px 0;
    border-bottom: 2px solid #d9d9d9;
}

.login-content .input-div.one{
	margin-top: 0;
}

.i{
	color: #d9d9d9;
	display: flex;
	justify-content: center;
	align-items: center;
}

.i i{
	transition: .3s;
}

.input-div > div{
    position: relative;
	height: 45px;
}

.input-div > div > h5{
	position: absolute;
	left: 10px;
	top: 50%;
	transform: translateY(-50%);
	color: #999;
	font-size: 18px;
	transition: .3s;
}

.input-div:before, .input-div:after{
	content: '';
	position: absolute;
	bottom: -2px;
	width: 0%;
	height: 2px;
	background-color: #d3be38;
	transition: .4s;
}

.input-div:before{
	right: 50%;
}

.input-div:after{
	left: 50%;
}

.input-div.focus:before, .input-div.focus:after{
	width: 50%;
}

.input-div.focus > div > h5{
	top: -5px;
	font-size: 15px;
}

.input-div.focus > .i > i{
	color: #d3be38;
}

.input-div > div > input{
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	border: none;
	outline: none;
	background: none;
	padding: 0.5rem 0.7rem;
	font-size: 1.2rem;
	color: #555;
	font-family: 'poppins', sans-serif;
}

.input-div.pass{
	margin-bottom: 4px;
}

a{
	display: block;
	text-align: right;
	text-decoration: none;
	color: #999;
	font-size: 0.9rem;
	transition: .3s;
}

a:hover{
	color: #d3be38;
}

.btn{
	display: block;
	width: 100%;
	height: 50px;
	border-radius: 25px;
	outline: none;
	border: none;
	background-image: linear-gradient(to right, blue, blue, blue);
	background-size: 200%;
	font-size: 1.2rem;
	color: #fff;
	font-family: 'Poppins', sans-serif;
	text-transform: uppercase;
	margin: 1rem 0;
	cursor: pointer;
	transition: .5s;
}
.btn:hover{
	background-position: right;
}


@media screen and (max-width: 1050px){
	.container{
		grid-gap: 5rem;
	}
}

@media screen and (max-width: 1000px){
	form{
		width: 290px;
	}

	.login-content h2{
        font-size: 2.4rem;
        margin: 8px 0;
	}

	
}

@media screen and (max-width: 900px){
	.container{
		grid-template-columns: 1fr;
	}

	

	.login-content{
		justify-content: center;
	}
}
</style>
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