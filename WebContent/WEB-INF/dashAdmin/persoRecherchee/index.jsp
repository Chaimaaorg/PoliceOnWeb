<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page import="com.java.helpers.ImageToBase64"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>      
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<%@include file="/WEB-INF/dashAdmin/headerAdmin.jsp" %>  
  <body>
    <div class="container" id="tablePersoDisparue">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
						<h2 style="margin-top:25px">Gestion des <b>Personnes recherchées</b></h2>
					</div>
					<div class="col-sm-6">					
						<a href="crudPr" class="btn" style="background-color:cadetblue;"><i class="fas fa-list"></i><span>Liste principale</span></a>
					</div>
					<div class="col-sm-6">
						<a href="#addEmployeeModal" class="btn btn-primary" style="display:flex;margin-top:-33px;margin-right:150px;" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Ajouter</span></a>
					</div>
					<div class="col-sm-6">
					<form action="findPr" method="POST" style="display:flex;margin-top:8px;margin-left:277px;">
                        <input type="text" class="form-control" style="width:auto;"name="search" placeholder="Recherche">
                        <button class="btn btn-primary" style="margin-left:0" type="submit"><i class="fas fa-search"></i></button>
                    </form>
                  </div>					
					
                </div>
            </div>
            <table class="table table-striped table-hover" >
                <thead>
                    <tr>
                        <th>Photo</th>                    
                        <th>CIN</th>
                        <th>Filiation connue</th>
						<th>Nationalité</th>
                        <th>Dernière place retrouvée</th>
                        <th>Description</th>
                    </tr>
                </thead>
                <tbody>
           
                 <c:forEach items = "${listpr}" var="personne" varStatus="boucle">
			    <c:set var="currentPlain" value="${personne}"/>
			    <c:set var="pathToPhoto" value="${currentPlain.photos}"/>
			    <c:set var="bs" value="${ImageToBase64.convertToBase64(pathToPhoto)}"/>                 
                    <tr>
		                <td class="persoImg"><c:if test="${not empty bs}"><img src='data:image/jpeg;base64,${bs}'></c:if></td>						
                       	<td>${personne.getCIN_pre() }</td>
		                <td>${personne.getFiliationconnue() }</td>
		                <td>${personne.getNationalite() }</td>
		                <td>${personne.getDerniereplaceretr() }</td>
		                <td>${personne.getDescription() }</td>
                        <td>
                            <a href="editPersonneRecherchee?CIN_pre=${personne.getCIN_pre() }" class="edit" ><i class="material-icons" data-toggle="tooltip" title="Modifier">&#xE254;</i></a>
                        	<a href="deletePersonneRecherchee?CIN_pre=${personne.getCIN_pre() }" onclick="return confirm('Cette action est irréversible , êtes-vous sûr de bien vouloir supprimer?');" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Supprimer">&#xE872;</i></a>	
                        
                        </td>
	                    </tr>
                     </c:forEach>
                </tbody>
               
            </table>
			
           
        </div>
    </div>
    	<!-- Add Modal HTML -->
	<div id="addEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form method="POST" action="addPersonneRecherchee">
					<div class="modal-header">						
						<h4 class="modal-title">Ajouter une personne recherchée</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<div class="form-group">
							<label>CIN</label>
							<input type="text" class="form-control" name="CIN_pre"  placeholder="Entrer le CIN" required>
						</div>
						<div class="form-group">
							<label>Filiation connue</label>
							<input type="text" class="form-control" name="filiationconnue" placeholder="Entrer sa filiation connue"  required>
						</div>
						<div class="form-group">
							<label>Nationalité</label>
							<input type="text" name="nationalite" placeholder="Entrer sa nationalité" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Dernièr place où on l'a reconnu</label>
							<input type="text"name="derniereplaceretr" placeholder="Entrer la dernière place où on l'a reconnu" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Description</label>
							<textarea name="description" class="form-control" placeholder="Description détaillée des faits ou traits dans le cas de photos non trouvées" required></textarea>
						</div>	
						<div class="form-group">
							<label>Photo</label>
							<input type="file"name="photos" class="form-control" >
						</div>					
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary" value="Ajouter">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
<style>
td img
{
  margin-left:auto;
  width:100px;
  height:100px;
}
  .container {
        color: #566787;
		font-family: 'Varela Round', sans-serif;
	}
	.table-wrapper {
        background: #fff;
        padding: 20px 25px;
        margin: -420px 0;
		border-radius: 3px;
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
    }
	.table-title {        
		padding-bottom: 15px;
		background: linear-gradient(whitesmoke,#9799ab);
		color: ;
		padding: 16px 30px;
		margin: -20px -25px 10px;
  		box-sizing: border-box;
  		border: 1px solid #d2d2d3;
  		border-radius: 5px;
  		box-shadow: 0 6px 7px -4px rgba(0, 0, 0, 0.2);
    }
    .table-title h2 {
		margin: 5px 0 0;
		font-size: 24px;
	}
	.table-title .btn-group {
		float: right;
	}
	.table-title .btn {
		color: #fff;
		float: right;
		font-size: 13px;
		border: none;
		min-width: 50px;
		border-radius: 2px;
		border: none;
		outline: none !important;
		margin-left: 10px;
	}
	.table-title .btn i {
		float: left;
		font-size: 21px;
		margin-right: 5px;
	}
	.table-title .btn span {
		float: left;
		margin-top: 2px;
	}
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
		padding: 12px 15px;
		vertical-align: middle;
    }
	table.table tr th:first-child {
		width: 60px;
	}
	table.table tr th:last-child {
		width: 100px;
	}
    table.table-striped tbody tr:nth-of-type(odd) {
    	background-color: #fcfcfc;
	}
	table.table-striped.table-hover tbody tr:hover {
		background: #f5f5f5;
	}
    table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
    }	
    table.table td:last-child i {
		opacity: 0.9;
		font-size: 22px;
        margin: 0 5px;
    }
	table.table td a {
		font-weight: bold;
		color: #566787;
		display: inline-block;
		text-decoration: none;
		outline: none !important;
	}
	table.table td a:hover {
		color: #2196F3;
	}
	table.table td a.edit {
        color: #FFC107;
    }
    table.table td a.delete {
        color: #F44336;
    }
    table.table td i {
        font-size: 19px;
    }
	table.table .avatar {
		border-radius: 50%;
		vertical-align: middle;
		margin-right: 10px;
	}
    .pagination {
        float: right;
        margin: 0 0 5px;
    }
    .pagination li a {
        border: none;
        font-size: 13px;
        min-width: 30px;
        min-height: 30px;
        color: #999;
        margin: 0 2px;
        line-height: 30px;
        border-radius: 2px !important;
        text-align: center;
        padding: 0 6px;
    }
    .pagination li a:hover {
        color: #666;
    }	
    .pagination li.active a, .pagination li.active a.page-link {
        background: #03A9F4;
    }
    .pagination li.active a:hover {        
        background: #0397d6;
    }
	.pagination li.disabled i {
        color: #ccc;
    }
    .pagination li i {
        font-size: 16px;
        padding-top: 6px
    }
    .hint-text {
        float: left;
        margin-top: 10px;
        font-size: 13px;
    }    
	/* Custom checkbox */
	.custom-checkbox {
		position: relative;
	}
	.custom-checkbox input[type="checkbox"] {    
		opacity: 0;
		position: absolute;
		margin: 5px 0 0 3px;
		z-index: 9;
	}
	.custom-checkbox label:before{
		width: 18px;
		height: 18px;
	}
	.custom-checkbox label:before {
		content: '';
		margin-right: 10px;
		display: inline-block;
		vertical-align: text-top;
		background: white;
		border: 1px solid #bbb;
		border-radius: 2px;
		box-sizing: border-box;
		z-index: 2;
	}
	.custom-checkbox input[type="checkbox"]:checked + label:after {
		content: '';
		position: absolute;
		left: 6px;
		top: 3px;
		width: 6px;
		height: 11px;
		border: solid #000;
		border-width: 0 3px 3px 0;
		transform: inherit;
		z-index: 3;
		transform: rotateZ(45deg);
	}
	.custom-checkbox input[type="checkbox"]:checked + label:before {
		border-color: #03A9F4;
		background: #03A9F4;
	}
	.custom-checkbox input[type="checkbox"]:checked + label:after {
		border-color: #fff;
	}
	.custom-checkbox input[type="checkbox"]:disabled + label:before {
		color: #b8b8b8;
		cursor: auto;
		box-shadow: none;
		background: #ddd;
	}
	/* Modal styles */
	.modal .modal-dialog {
		max-width: 400px;
	}
	.modal .modal-header, .modal .modal-body, .modal .modal-footer {
		padding: 20px 30px;
	}
	.modal .modal-content {
		border-radius: 3px;
	}
	.modal .modal-footer {
		background: #ecf0f1;
		border-radius: 0 0 3px 3px;
	}
    .modal .modal-title {
        display: inline-block;
    }
	.modal .form-control {
		border-radius: 2px;
		box-shadow: none;
		border-color: #dddddd;
	}
	.modal textarea.form-control {
		resize: vertical;
	}
	.modal .btn {
		border-radius: 2px;
		min-width: 100px;
	}	
	.modal form label {
		font-weight: normal;
	}

	
</style>
<script>
$(document).ready(function(){
	// Activate tooltip
	$('[data-toggle="tooltip"]').tooltip();
	
	// Select/Deselect checkboxes
	var checkbox = $('table tbody input[type="checkbox"]');
	$("#selectAll").click(function(){
		if(this.checked){
			checkbox.each(function(){
				this.checked = true;                        
			});
		} else{
			checkbox.each(function(){
				this.checked = false;                        
			});
		} 
	});
	checkbox.click(function(){
		if(!this.checked){
			$("#selectAll").prop("checked", false);
		}
	});
});
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
document.getElementById("tablePersoDisparue").style.marginLeft = "350px";
document.body.style.backgroundColor = "#e6e8ed";/*#e6e8ed*/

}

function closeSidebar() {
	
document.getElementById("sidebar").style.width = "0";
document.getElementById("main").style.marginLeft = "0";
document.getElementById("tablePersoDisparue").style.marginLeft = "200px";
document.body.style.backgroundColor = "whitesmoke";
}
</script>
