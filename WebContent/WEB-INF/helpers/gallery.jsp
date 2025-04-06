<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/WebRessources/styles/gallery.css" type="text/css">

<div class="contain-gallery">
	<div class="gallery">
		<h1>Personnes disparues</h1>
	  <div class="desc">Aidez-nous à retrouver des personnes disparues.</div>
	  <a href="allPdVisiteur">Personnes disparues <i class="fas fa-angle-right"></i></a>
	</div>

	<div class="gallery">
		<h1>Personnes recherchées</h1>
	  <div class="desc">Aidez-nous à rechercher des auteurs de délits .</div>
	  <a href="allPrVisiteur">Personnes recherchées <i class="fas fa-angle-right"></i></a>
	</div>
	
	<div class="gallery">
		<h1>Propriétaires recherchés</h1>
	  <div class="desc">Aidez-nous à faire progresser le dossier.</div>
	  <a href="allOwnerRVisiteur">Propriétaires recherchés <i class="fas fa-angle-right"></i></a>
	</div>
	
	<div class="gallery">
		<h1>Personnes non identifiées</h1>
	  <div class="desc">Aidez-nous à faire progresser le dossier.</div>
	  <a href="allPniVisiteur">Personnes non identifiées <i class="fas fa-angle-right"></i></a>
	</div>
</div>
<style>
@charset "UTF-8";
 div.contain-gallery{ 
	 margin-left:80px; 
	 margin-top:400px; /*500px*/
} 
div.gallery {
  margin: 10px;
  float: left;
  width: 320px;
  background-color:white;
  border: 0.3px solid lightgrey;  
  border-radius: 15px 15px 30px 5px;
  box-shadow: 10px 10px 10px whitesmoke;
  
  
}
div.gallery a {
  float: left;
  font-size: 16px;
  color: #3f69a8;
  padding: 20px 30px;
  text-decoration: none;
   font-size: 16px;
  
}
div.gallery h1 {
  font-size: 16px;
  cursor:default;
  color: #3f69a8;
  text-align: center;
  padding: 20px 30px;
  text-decoration: none;
}
div.gallery:hover{
  border: 1px solid #0bc3ec;

}

div.desc {
  width: 320px;
  margin-left:2px;
  cursor:default;
  padding:25px 0;
  text-align: center;
  align-items:center;
}</style>

