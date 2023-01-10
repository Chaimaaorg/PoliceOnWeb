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
<style>
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
</head>  
  <body>
  	<a href="#addEmployeeModal" class="btn btn-sm btn-primary" style="font-size:15px;display:flex;width:10%;margin-bottom:-50px;margin-left:130px;" data-toggle="modal"><i class="material-icons">&#xE147;</i>Ajouter</a>
    	<!-- Add Modal HTML -->
	<div id="addEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form method="POST" action="addFaq">
					<div class="modal-header">						
						<h4 class="modal-title">Ajouter une question fréquente</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<div class="form-group">
							<label>Question:</label>
							<input type="text" class="form-control" name="question"  placeholder="Entrer la question" required>
						</div>
						<div class="form-group">
							<label>Réponse</label>
							<textarea type="text" class="form-control" name="reponse" placeholder="Entrer la réponse"  required></textarea>
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

