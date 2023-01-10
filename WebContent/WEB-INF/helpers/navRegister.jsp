<!DOCTYPE html>
<html>
<head>
<style>
#imgg {
  margin-top:8px;
  margin-left:50px;
  width:auto;
  height:50px;
}
.ul{
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #343a40;
  height:65px;
  font-size:18px;
  font-family: Arial, Helvetica, sans-serif;
  font-weight:bold;
  font:bold;
  width: 100%;
}
li label{
  color: #fff;
  font-size: 18px;
  font-weight: 500;
  padding: 9px 17px;
  border-radius: 5px;
  transition: all 0.3s ease;
}
li {
  float: left;
  
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 20px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #6282a9;
  text-decoration:none;
  color:#FFF;
}
</style>
</head>
<body>

<div class="ul">
  <li><img id="imgg" src="<%=request.getContextPath()%>/WebRessources/images/logo.png" ></li>
  <li><a class="active" href="indexServlet">Accueil</a></li>
  <li><a href="About">A propos</a></li>
  <li><a href="Features">Features</a></li>
  <li><a href="Comgeneral">Services</a></li>
  <li><a href="faqVisiteur">FAQ</a></li>

  
</div>

</body>
</html>


