<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.card
{
	box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;

}
.card-block
{
	width:360px;
	height:350px;
}
.card-img-top
{
	cursor:grab;
    /* (A) OPTIONAL DIMENSIONS */
 
  	/* (B) ANIMATE ZOOM */
  	/* ease | ease-in | ease-out | linear */
  	transition: transform ease-in-out 0.3s;
}
/* (C) ZOOM ON HOVER */
.card-img-top:hover { transform: scale(0.8); }
</style>
</head>
<body>
<div class="row">
<div class="col-sm-3" style="margin-left:15px;">
<div class="card card-block">
  <img class="card-img-top" src="https://th.bing.com/th/id/R.acafaeb2b3a54ac8481f0cfbcece3b9c?rik=hrJyIDbZd0397g&pid=ImgRaw&r=0" data-holder-rendered="true" style="height: 190px; width: 100%; display: block;">
  <div class="card-block">
    <h4 class="card-title" style="margin-left:10px;text-transform:uppercase;font-size:18px;font-weight:bold;font-family:Montserrat, sans-serif;">Protéger</h4>
    <p class="card-text" style="text-align:center;font-weight:350;color:black;font-size:18px;">Aidez-nous à protéger vos familles et proches.</p>
    <a href="addPlainte" class="btn btn-primary" style="margin-top:5px;margin-left:200px;">Plaintes à distance</a>
  </div>
  </div>
</div>
<div class="col-sm-3" style="margin-left:-12px;">
<div class="card card-block">
  <img class="card-img-top"  src="https://th.bing.com/th/id/R.b64611e4005b1c3f9020b706c9a2e4bf?rik=hHmKjfb4io7DIw&pid=ImgRaw&r=0" data-holder-rendered="true" style="height: 190px; width: 100%; display: block;">
  <div class="card-block">
    <h4 class="card-title" style="margin-left:10px;text-transform:uppercase;font-weight:bold;font-family:Montserrat, sans-serif;">Aider à enquêter</h4>
    <p class="card-text" style="text-align:center;font-weight:350;color:black;font-size:18px;">Aidez-nous à rechercher des auteurs ou victimes de délits .</p>
    <a href="allPrVisiteur" class="btn btn-primary" style="margin-top:5px;margin-left:170px;">Personnes recherchées</a>
  </div>
</div>
          </div>

<div class="col-sm-3" style="margin-left:-12px;">
<div class="card card-block">
  <img class="card-img-top"  src="https://th.bing.com/th/id/OIP.9X5TXkg3SwDTu69LxbKShAHaD4?pid=ImgDet&rs=1" data-holder-rendered="true" style="height: 190px; width: 100%; display: block;">
  <div class="card-block">
    <h4 class="card-title" style="margin-left:10px;text-transform:uppercase;font-weight:bold;font-family:Montserrat, sans-serif;">Tueur en série</h4>
    <p class="card-text" style="margin-top:10px;text-align:center;font-weight:350;color:black;font-size:18px;">Aidez-nous à faire progresser le dossier et trouver l'acteur.</p>
    <a href="allPrVisiteur" class="btn btn-primary" style="margin-top:5px;margin-left:240px;">Témoignage</a>
  </div>
  </div>
</div>

  
<div class="col-sm-3" style="margin-left:-12px;">
<div class="card card-block">
  <img class="card-img-top"  src="https://th.bing.com/th/id/OIP.Jyzb2HoL082XIPXfBswr_QHaDt?pid=ImgDet&rs=1" data-holder-rendered="true" style="height: 190px; width: 100%; display: block;">
  <div class="card-block">
    <h4 class="card-title" style="margin-left:10px;text-transform:uppercase;font-weight:bold;font-family:Montserrat, sans-serif;">Personnes disparues</h4>
    <p class="card-text" style="text-align:center;font-weight:350;color:black;font-size:18px;">Aidez-nous à faire progresser les dossiers de recherche</p>
    <a href="allPdVisiteur" class="btn btn-primary" style="margin-top:15px;margin-left:183px;">Personnes disparues</a>
  </div>
  </div>
</div>
</div>
</body>
</html>