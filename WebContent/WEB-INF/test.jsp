<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page import="com.java.helpers.ImageToBase64"%>    

<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Swiper CSS -->
<%--     <link rel="stylesheet" href="<%=request.getContextPath()%>/WebRessources/styles/swiper-bundle.min.css"> --%>

        <!-- CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/WebRessources/styles/styleSlider.css">
<style>
@charset "UTF-8";
/* Google Fonts - Poppins */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap');
.slide-container{
  max-width: 1120px;
  width: 100%;
  padding: 40px 0;
}
.slide-content{
  margin: 0 40px;
  overflow: hidden;
  border-radius: 25px;
}
.card{
  border-radius: 25px;
  background-color: #FFF;
}
.image-content,
.card-content{
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 10px 14px;
}
.image-content{
  position: relative;
  row-gap: 5px;
  padding: 25px 0;
}
.overlay{
  position: absolute;
  left: 0;
  top: 0;
  height: 100%;
  width: 100%;
  background-color: #4070F4;
  border-radius: 25px 25px 0 25px;
}
.overlay::before,
.overlay::after{
  content: '';
  position: absolute;
  right: 0;
  bottom: -40px;
  height: 40px;
  width: 40px;
  background-color: #4070F4;
}
.overlay::after{
  border-radius: 0 25px 0 0;
  background-color: #FFF;
}
.card-image{
  position: relative;
  height: 150px;
  width: 150px;
  border-radius: 50%;
  background: #FFF;
  padding: 3px;
}
.card-image .card-img{
  height: 100%;
  width: 100%;
  object-fit: cover;
  border-radius: 50%;
  border: 4px solid #4070F4;
}
.name{
  font-size: 18px;
  font-weight: 500;
  color: #333;
}
.description{
  font-size: 14px;
  color: #707070;
  text-align: center;
}
.button{
  border: none;
  font-size: 16px;
  color: #FFF;
  padding: 8px 16px;
  background-color: #4070F4;
  border-radius: 6px;
  margin: 14px;
  cursor: pointer;
  transition: all 0.3s ease;
}
.button:hover{
  background: #265DF2;
}

.swiper-navBtn{
  color: #6E93f7;
  transition: color 0.3s ease;
}
.swiper-navBtn:hover{
  color: #4070F4;
}
.swiper-navBtn::before,
.swiper-navBtn::after{
  font-size: 35px;
}
.swiper-button-next{
  right: 0;
}
.swiper-button-prev{
  left: 0;
}
.swiper-pagination-bullet{
  background-color: #6E93f7;
  opacity: 1;
}
.swiper-pagination-bullet-active{
  background-color: #4070F4;
}

@media screen and (max-width: 768px) {
  .slide-content{
    margin: 0 10px;
  }
  .swiper-navBtn{
    display: none;
  }
  
}
</style>                                        
    </head>
    <body>
        <div class="slide-container swiper">
            <div class="slide-content">
                <div class="card-wrapper swiper-wrapper">
				<c:forEach items="${listperso}" var="perso" varStatus="status">
			    <c:set var="currentPlain" value="${perso}"/>
			    <c:set var="pathToPhoto" value="${currentPlain.photos}"/>
			    <c:set var="bs" value="${ImageToBase64.convertToBase64(pathToPhoto)}"/>				         
                    <div class="card swiper-slide">
                        <div class="image-content">
                            <span class="overlay"></span>

                            <div class="card-image">
                                <img src='data:image/jpeg;base64,${bs}'alt="" class="card-img">
                            </div>
                        </div>

                        <div class="card-content">
                            <h2 class="name">CIN:${perso.getCIN_pre() }/Filiation connue:${perso.getFiliationconnue() }</h2>
                            <p class="description">Description:${perso.getDescription() },Nationalité: ${perso.getNationalite() },Dernière place connue:${perso.getDerniereplaceretr() }</p>

                            <button class="button">Voir plus de détails</button>
                        </div>
                    </div>                
                
                </c:forEach>

                </div>
            </div>

            <div class="swiper-button-next swiper-navBtn"></div>
            <div class="swiper-button-prev swiper-navBtn"></div>
            <div class="swiper-pagination"></div>
        </div>
        
    </body>

    <!-- Swiper JS -->
<%--     <link rel="stylesheet" href="<%=request.getContextPath()%>/WebRessources/js/swiper-bundle.min.js"> --%>
<script src="<%=request.getContextPath()%>/WebRessources/js/swiper-bundle.min.js"></script> 
    <!-- JavaScript -->
<%--     <link rel="stylesheet" href="<%=request.getContextPath()%>/WebRessources/js/scriptSlider.js"> --%>
<script src="<%=request.getContextPath()%>/WebRessources/js/scriptSlider.js"></script> 

</html>