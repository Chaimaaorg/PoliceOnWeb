/**
 * 
 */

function toggleForm (){
	var form = document.getElementById("infractionForm");
  if (form.style.display === "none") {
    form.style.display = "block";
  } else {
    form.style.display = "none";
  }
}

function closeCheck(){
	alert ("Your ticket has been sent");
	window.location.replace("/ProjetJEE_Police/login");
}