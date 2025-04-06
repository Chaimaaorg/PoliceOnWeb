function toggleSidebar() {
	  var sidebar = document.getElementById("sidebar");
	  var main = document.getElementById("main");
	  var tableusers = document.getElementById("tableUsers");
	  var currentWidth = sidebar.style.width;
	  
	  if (currentWidth === "0px" || currentWidth === "") {
	    openSidebar();
	  } else {
	    closeSidebar();
	  }
	}
	function openSidebar() {
	document.getElementById("sidebar").style.width = "269px";/*269px*/
	document.getElementById("main").style.marginLeft = "250px";
	document.getElementById("idfaq").style.marginLeft = "250px";
	document.getElementById("tableUsers").style.marginLeft = "269px";
	document.body.style.backgroundColor = "whitesmoke";/*#e6e8ed*/
	
	
	}
	
	function closeSidebar() {
	document.getElementById("sidebar").style.width = "0";
	document.getElementById("main").style.marginLeft= "0";
	document.getElementById("idfaq").style.marginLeft = "0";
	document.getElementById("tableUsers").style.marginLeft = "90px";
	document.body.style.backgroundColor = "white";
	}