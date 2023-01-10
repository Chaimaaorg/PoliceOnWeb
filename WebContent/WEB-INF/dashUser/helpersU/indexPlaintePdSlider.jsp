<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page import="com.java.helpers.ImageToBase64"%>    

<!DOCTYPE html>
<html lang="en">
<!--divinectorweb.com-->
<head>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Berkshire+Swash&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
section 
{
    width:auto;
    height:auto;
    margin-left:20px;/*auto*/
    margin-top:40px;
    margin-bottom:100px;
    margin-right:540px;

}
.testimonials{
  max-width: 1000px;
  padding: 0 15px 50px;
  margin: 0 auto 80px auto;
}
.single-item{
  background: #EBF4FA;
  width:100%;
  height:450px;
  color: #111;
  padding: 15px;
  margin: 45px 15px;
}
.profile{
  margin-bottom: 30px;
  text-align: center;
  margin-left:-20px; 
  margin-top:50px;   
}
.img-area {
margin: 0 15px 15px 15px;
}
.img-area img {
height: 200px;
width: 200px;
border-radius: 50%;
border: 7px solid #6282a9;
}
.content{
  font-size: 18px;
  
}
.content p {
text-align: justify;
margin-top:50px;
margin-left:-100px;
}
.content p span {
font-size: 48px;
margin-right: 20px;
color: #6282a9;
}
.i {
margin-right: 25px;
font-weight:bold;
font:bold;
text-align:center;
}
.bio h4 {
font-family: 'Berkshire Swash', cursive;
font-size:21px;

}
.bio h6
{
font-size:21px;
}
.carousel-control-next-icon, .carousel-control-prev-icon {
background-color: #6282a9;
}

</style>
</head>
<body>
    <section>
        <div class="container">
            <div class="testimonials">            
                <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                  <div class="carousel-inner">
                   <c:forEach items = "${listplainte}" var="plain" varStatus="status">    
					    <c:set var="currentPlain" value="${plain}"/>
					    <c:set var="pathToPhoto" value="${currentPlain.photos}"/>
					    <c:set var="bs" value="${ImageToBase64.convertToBase64(pathToPhoto)}"/>                          
					<c:if test="${status.first}">
                    <div class="carousel-item active">
                      <div class="single-item">
                          <div class="row">
                              <div class="col-md-5">
                                  <div class="profile">
                                      <div class="img-area">
                                          <img src='data:image/jpeg;base64,${bs}' alt="" >
                                      </div>
                                      <div class="bio">
                                          <h6>CIN:${plain.getCIN_pd() }</h6>
                                          <h4>${plain.getNom() } ${plain.getPrenom() }</h4>
                                      </div>
                                  </div>
                              </div>
                              <div class="col-md-6">
                                  <div class="content">
                                      <p><span><i class="fa fa-quote-left"></i></span>${plain.getDescription()}</p>
                                      <p class="socials">
                                          <div class="i">${plain.getDatedisparition() }</div>
                                          <div class="i">${plain.getLieudisparition() }</div>
                                      </p>                                  		
                                  </div>
                              </div>
                          </div>
                      </div>
                    </div>
                    </c:if>
				<c:if test="${!status.first}">
                    <div class="carousel-item">
                      <div class="single-item">
                          <div class="row">
                              <div class="col-md-5">
                                  <div class="profile">
                                      <div class="img-area">
                                          <img src='data:image/jpeg;base64,${bs}' alt="" >
                                      </div>
                                      <div class="bio">
                                          <h6>CIN:${plain.getCIN_pd() }</h6>
                                          <h4>${plain.getNom() } ${plain.getPrenom() }</h4>
                                      </div>
                                  </div>
                              </div>
                              <div class="col-md-6">
                                  <div class="content">
                                      <p><span><i class="fa fa-quote-left"></i></span>${plain.getDescription()}</p>
                                      <p class="socials">
                                      <p class="socials">
                                          <div class="i">${plain.getDatedisparition() }</div>
                                          <div class="i">${plain.getLieudisparition() }</div>
                                      </p>                                        
                                  </div>
                              </div>
                          </div>
                      </div>
                    </div>
                      </c:if>
      			</c:forEach>
                    </div>
                  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                  </button>
                  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                  </button>
                </div>
                
            </div>
        </div>
    </section>
    
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
