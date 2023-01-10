<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/WebRessources/styles/footer.css" type="text/css">
<footer class="footer-distributed">

			<div class="footer-left">

				<h3>Allo<span>Police</span></h3>

				<p class="footer-links">
					<a href="#" class="link-1">Accueil</a>
													
					<a href="#">A propos</a>
					
					<a href="#">FAQ</a>
					
					<a href="#">Contact</a>
				</p>

				<p class="footer-company-name">AlloPolice © 2022</p>
			</div>

			<div class="footer-center">
			<div class="name">A propos de AlloPolice</div>
				<p class="footer-company-about">
Sur Police-on-web, vous pouvez porter plainte en ligne pour des petits délits; signaler des personnes disparues des vols, méfaits,retrouver vos affaires perdues ou aider à retrouver des personnes recherchées, disparues ou non identifiées..</p>

					<div>
					<i class="fa fa-map-marker"></i>
					<p><span>Madinat Al Irfan</span> Rabat Agdal, Rabat</p>
				</div>

				<div>
					<i class="fa fa-phone"></i>
					<p>0522351383</p>
				</div>

				<div>
					<i class="fa fa-envelope"></i>
					<p><a href="mailto:allopolice@gmail.com">allopolice@gmail.com</a></p>
				</div>


			</div>

			<div class="footer-right">
			<div class="imageFooter">				
				<img src="<%=request.getContextPath()%>/WebRessources/images/logo.png" style="margin-top:100px;width:250px;height:40%;margin-left:-20px;" >
			</div>
			</div>

		</footer>
		
		<style>
@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,500,300,700);

* {
  font-family: Open Sans;
}


.footer-distributed{
	background: #343a40;
	box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.12);
	box-sizing: border-box;
	width: 100%;
	text-align: left;
	font: bold 16px sans-serif;
	padding: 55px 50px;
}

.footer-distributed .footer-left,
.footer-distributed .footer-center{
	display: inline-block;
	vertical-align: top;
}

/* Footer left */

.footer-distributed .footer-left{
	width: 40%;
}

/* The company logo */

.footer-distributed h3{
	color:  #ffffff;
	font: normal 36px 'Open Sans', cursive;
	margin: 0;
}

.footer-distributed h3 span{
	color:  #6381A8;
}

/* Footer links */

.footer-distributed .footer-links{
	color:  #ffffff;
	margin: 20px 0 12px;
	padding: 0;
}

.footer-distributed .footer-links a{
	display:inline-block;
	line-height: 1.8;
  font-weight:400;
	text-decoration: none;
	color:  inherit;
}

.footer-distributed .footer-company-name{
	color:  #6381A8;
	font-size: 14px;
	font-weight: normal;
	margin: 0;
}

/* Footer Center */

.footer-distributed .footer-center{
	width: 35%;
}

.footer-distributed .footer-center i{
	background-color:#6381A8;
	color: #ffffff;
	font-size: 16px;
	width: 30px;
	height: 38px;
	border-radius: 50%;
	text-align: center;
	line-height: 42px;
	margin: 10px 15px;
	vertical-align: middle;
}


.footer-distributed .footer-center p{
	display: inline-block;
	color: #ffffff;
    font-weight:400;
	vertical-align: middle;
	margin:0;
}

.footer-distributed .footer-center p span{
	display:block;
	font-weight: normal;
	font-size:14px;
	line-height:2;
}

.footer-distributed .footer-center p a{
	color:  #6381A8;
	text-decoration: none;;
}

.footer-distributed .footer-links a:before {
  content: "|";
  font-weight:300;
  font-size: 20px;
  left: 0;
  color: #fff;
  display: inline-block;
  padding-right: 5px;
}

.footer-distributed .footer-links .link-1:before {
  content: none;
}

/* Footer Right */


.footer-distributed .footer-company-about{
	line-height: 20px;
	color:  #92999f;
	font-size: 13px;
	margin: 0;
}
.footer-right .imageFooter img
{
	width: 100%;
	margin-left:550px ;
	margin-top:0%;
	
}

.footer-distributed .footer-company-about{
	display: block;
	color:  #ffffff;
	font-size: 14px;
	font-weight: bold;
	margin-bottom: 20px;
	justify-content:center;
}
.name{
	display: block;
	color: #6381A8;
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 20px;
}

.footer-distributed .footer-icons{
	margin-top: 25px;
}
.footer-right .imageFooter {
	margin:auto;
	width:10%;
	height:10%;
}

.footer-distributed .footer-icons a{
	display: inline-block;
	width: 35px;
	height: 35px;
	cursor: pointer;
	background-color:  #33383b;
	border-radius: 2px;

	font-size: 20px;
	color: #ffffff;
	text-align: center;
	line-height: 35px;

	margin-right: 3px;
	margin-bottom: 5px;
}

/* If you don't want the footer to be responsive, remove these media queries */

@media (max-width: 880px) {

	.footer-distributed{
		font: bold 14px sans-serif;
	}


	.footer-distributed .footer-left,
	.footer-distributed .footer-center
	{
		display: block;
		width: 100%;
		margin-bottom: 40px;
		text-align: center;
	}

	.footer-distributed .footer-center i{
		margin-left: 0;
	}

}
		
		</style>
