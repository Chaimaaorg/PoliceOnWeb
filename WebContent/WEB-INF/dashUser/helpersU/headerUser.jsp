<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <!---Fontawesome CDN Link-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <!----Custom CSS Filw Link--->
    <link rel="stylesheet" href="style.css">
    <style>
*{
  padding: 0;
  margin: 0;
  text-decoration: none;
  list-style: none;
  box-sizing: border-box;
}
nav{
  overflow: hidden;
  background-color: #343a40;
  font-family: Arial, Helvetica, sans-serif;
  font-weight:bold;
  font:bold;
  height: 65px;
  width: 100%;
  border: 0;
  display:block;
/*   pour fixer le navbar au top   
   top:0;  
   position:fixed; */
}
label.logo{
  color: #fff;
  font-size: 35px;
  line-height: 80px;
  padding: 0 30px;
  font-weight: bold;
}
#imgg {
  margin-bottom:20px;
  width:auto;
  height:50px;
  margin-top:-7px;
}
nav ul{
  float: right;
  margin-right: 20px;
}
nav ul li{
  display: inline-block;
  line-height: 80px;
  margin: -5px 5px;
}
nav ul li a{
  color: #fff;
  font-size: 17px;
  padding: 7px 7px;
  border-radius: 3px;  
  text-decoration:none;
}
a.active,a:hover{
  background: #fff;
  transition: .5s;
  color: #022f69;
}
nav ul li a:hover{
  text-decoration:none; 
}
.checkbtn{
  font-size: 30px;
  color: #fff;
  float: right;
  line-height: 80px;
  margin-right: 40px;
  cursor: pointer;
  display: none;
}
#check{
  display: none;
}
@media (max-width: 968px){
  label.logo{
    font-size: 30px;
    padding-left: 50px;
  }
  nav ul li a{
    font-size: 16px;
  }
}
@media (max-width: 875px){
  .checkbtn{
    display: block;
  }
  nav ul{
    position: fixed;
    width: 100%;
    height: 100vh;
    background: #27282c;
    top: 80px;
    left: -100%;
    text-align: center;
    transition: all .5s;
  }
  nav ul li{
    display: block;
    margin: 20px 0;
    line-height: 30px;
  }
  nav ul li a{
    font-size: 20px;
  }
  a:hover, a.active{
    background: none;
    color: #0082e6;
  }
  #check:checked ~ ul{
    left: 0;
  }
}
</style>
<title>Espace personnel</title>
</head>
<body>
  <nav>
    <label class="logo"><img id="imgg" src="<%=request.getContextPath()%>/WebRessources/images/logo.png" ></label>
    <ul>
      <li><a class="active" href="RedirectServlet"><i class="fas fa-home"></i> Accueil</a></li>
      <li><a href="addPlainte"><i class="fas fa-plus"></i> Ajouter une plainte</a></li>
      <li><a href="addPlaintePersoDisparue"><i class="fas fa-user"></i> Ajouter une personne disparue</a></li>
      <li><a href="archive"><i class='fas fa-file-archive'></i> Historique</a></li>
      <li><a href="test"><i class="fas fa-eye"></i> Témoignage</a></li>
      <li><a href="indexServlet"><i class='fas fa-sign-out-alt'></i> Se déconnecter</a></li>
    </ul>
  </nav>
</body>
</html>
