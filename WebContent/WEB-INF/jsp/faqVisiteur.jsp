<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>FAQ</title>
<style>body {
  background: #f4f4f4;
  display: flex;
}

#faq {
  max-width: 700px;
  margin: auto;
  padding: 0 15px;
  text-align: center;
}

section.faq {
  padding-top: 2em;
  padding-bottom: 3em;
}

#faq .ul {
  text-align: left;
}
.transition, p, .ul li i:before, ul li i:after {
  transition: all 0.3s;
}

#faq .no-select, #faq h2 {
  -webkit-tap-highlight-color: transparent;
  -webkit-touch-callout: none;
  user-select: none;
}

#faq h1 {
  color: #000;
  margin-bottom: 30px;
  margin-top: -30px;
  margin-left:350px;
}

#faq h2 {
  color: #cc071e;
  font-family: 'hm_light', sans-serif;
  font-size: 20px;
  line-height: 34px;
  text-align: left;
  padding: 15px 15px 0;
  text-transform: none;
  font-weight: 300;
  letter-spacing: 1px;
  display: block;
  margin: 0;
  cursor: pointer;
  transition: .2s;
}

#faq p {
  color: #333;
  text-align: left;
  font-family: 'hm_light', sans-serif;
  font-size: 14px;
  line-height: 1.45;
  position: relative;
  overflow: hidden;
  max-height: 250px;
  will-change: max-height;
  contain: layout;
  display: inline-block;
  opacity: 1;
  transform: translate(0, 0);
  margin-top: 5px;
  margin-bottom: 15px;
  padding: 0 50px 0 15px;
  transition: .3s opacity, .6s max-height;
  hyphens: auto;
  z-index: 2;
}

#faq .ul {
  list-style: none;
  perspective: 900;
  padding: 0;
  margin: 0;
  margin-left:5px;
  width:1000px;
}
#faq .ul li {
  position: relative;
  overflow: hidden;
  padding: 0;
  margin: 0;
  /padding-bottom: 4px;/
  /padding-top: 18px;/
  background: #fff;
  box-shadow: 0 3px 10px -2px rgba(0,0,0,0.1);
  -webkit-tap-highlight-color: transparent;
}
#faq .ul li + li {
  margin-top: 15px;
}
#faq .ul li:last-of-type {
  padding-bottom: 0;
}
#faq .ul li i {
  position: absolute;
  transform: translate(-6px, 0);
  margin-top: 28px;
  right: 15px;
}
#faq .ul li i:before, .ul li i:after {
  content: "";
  position: absolute;
  background-color: #cc071e;
  width: 3px;
  height: 8px;
}
#faq .ul li i:before {
  transform: translate(-2px, 0) rotate(45deg);
}
#faq .ul li i:after {
  transform: translate(2px, 0) rotate(-45deg);
}
#faq .ul li input[type=checkbox] {
  position: absolute;
  cursor: pointer;
  width: 100%;
  height: 100%;
  z-index: 1;
  opacity: 0;
  touch-action: manipulation;
}
#faq .ul li input[type=checkbox]:checked ~ h2 {
  color: #000;
}
#faq .ul li input[type=checkbox]:checked ~ p {
  /margin-top: 0;/
  max-height: 0;
  transition: .3s;
  opacity: 0;
  /transform: translate(0, 50%);/
}
#faq .ul li input[type=checkbox]:checked ~ i:before {
  transform: translate(2px, 0) rotate(45deg);
}
#faq .ul li input[type=checkbox]:checked ~ i:after {
  transform: translate(-2px, 0) rotate(-45deg);
}

a,
a:visited,
a:focus,
a:active,
a:link {
  text-decoration: none;
  outline: 0;
}

a {
  color: currentColor;
  transition: .2s ease-in-out;
}

h1, h2, h3, h4 {
  margin: .3em 0;
}

.ul {
  padding: 0;
  list-style: none;
}

img {
  vertical-align: middle;
  height: auto;
  width: 100%;
}</style>
</head>
<div class="bb" style=" position: fixed; top: 0; left: 0width: 100%;z-index: 999;">
	<%@include file="/WEB-INF/helpers/header.jsp" %>        
</div>
<body>
<div class="aa" style="margin-top:50px;margin-right:-90%;">
		
		<%@include file="/WEB-INF/helpers/carousel.jsp" %> 
	 </div>
<div id="faq" style="margin-top:40%;margin-right:40%;width:100%;">
  <h1>FAQ</h1>
  <div class="ul">
    <c:forEach items = "${faqs}" var="freelancer" varStatus="boucle">
    <li>
      <input type="checkbox" checked>
      <i></i>
      <h2>${freelancer.getQuestion() }</h2>
      <p>${freelancer.getReponse() }</p>
    </li>
    </c:forEach>
  </div>
</div>
<br>
<br><br><br><br><br><br>
</body>
<div class="ab" style="left: 0;right: -40px;position:absolute;margin-top:80%;">
		<%@include file="/WEB-INF/helpers/footer.jsp" %>        
</div>
	<script src="//code.tidio.co/t3ldv3d3us4al3ysr65yzegetfe25blr.js" async></script>	      

</html>