<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.java.beans.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>
 <%
        User user = (User) session.getAttribute("user");
        if (user != null) {
    %>
<form action="updateUser" method="POST">
<div class="wrapper">
    <div class="title">
        Mes informations personnelles
    </div>
   <div class="form">
       <div class="inputfield">
          CIN:
     <input type="text" class="input" name="CIN" value=<%= user.getCIN() %> readonly>
     
        </div>  
        <div class="inputfield">
          Prenom:
     <input type="text" class="input" name="prenom" value=<%= user.getPrenom() %>>
     
        </div>  
        <div class="inputfield">
          Nom:
     <input type="text" class="input" name="nom"  value=<%= user.getNom() %> >
     
        </div>  
        <div class="inputfield">
        Adresse:
        <input type="text" class="input" name="adresse"  value=<%= user.getAdresse() %> >
        </div>
        <div class="inputfield">
        Tel:
        <input type="text" class="input" name="tel" value=<%= user.getTel() %> >
        </div>
        <div class="inputfield">
        Email:
        <input type="text" class="input" name="email" value=<%= user.getEmail() %> >
        </div>
        <div class="inputfield">
          Password:
     <input type="text" class="input" name="mdp" value=<%= user.getMdp() %> >
     
        </div>
         <div class="inputfield">
        <input type="submit" value=Modifier class="btn">
      </div>
      </div>
      </div>
      </form>
       
       
    <%
        } else {
    %>
        <p>User not found in session</p>
    <%
        }
    %>
</body>
</html>

<style>
@import url('https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap');

*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Montserrat', sans-serif;
}
.wrapper{
  max-width: 500px;
  width: 100%;
  background: #fff;
  margin: 50px 1005px;/*50 20*/
  box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.35);
  padding: 30px;
}

.wrapper .title{
  font-size: 24px;
  font-weight: 700;
  margin-bottom: 25px;
  color: #343A40;
  text-transform: uppercase;
  text-align: center;
}

.wrapper .form{
  width: 100%;
}

.wrapper .form .inputfield{
  margin-bottom: 15px;
  display: flex;
  align-items: center;
}

.wrapper .form .inputfield label{
   width: 200px;
   color: #757575;
   margin-right: 10px;
   font-size: 14px;
}

.wrapper .form .inputfield .input,
.wrapper .form .inputfield .textarea{
  width: 100%;
  outline: none;
  border: 1px solid #d5dbd9;
  font-size: 15px;
  padding: 8px 10px;
  border-radius: 3px;
  transition: all 0.3s ease;
}

.wrapper .form .inputfield .textarea{
  width: 100%;
  height: 125px;
  resize: none;
}

.wrapper .form .inputfield .custom_select{
  position: relative;
  width: 100%;
  height: 37px;
}

.wrapper .form .inputfield .custom_select:before{
  content: "";
  position: absolute;
  top: 12px;
  right: 10px;
  border: 8px solid;
  border-color: #d5dbd9 transparent transparent transparent;
  pointer-events: none;
}

.wrapper .form .inputfield .custom_select select{
  -webkit-appearance: none;
  -moz-appearance:   none;
  appearance:        none;
  outline: none;
  width: 100%;
  height: 100%;
  border: 0px;
  padding: 8px 10px;
  font-size: 15px;
  border: 1px solid #d5dbd9;
  border-radius: 3px;
}


.wrapper .form .inputfield .input:focus,
.wrapper .form .inputfield .textarea:focus,
.wrapper .form .inputfield .custom_select select:focus{
  border: 1px solid #C0C0C0;
}

.wrapper .form .inputfield p{
   font-size: 14px;
   color: #757575;
}
.wrapper .form .inputfield .check{
  width: 15px;
  height: 15px;
  position: relative;
  display: block;
  cursor: pointer;
}
.wrapper .form .inputfield .check input[type="checkbox"]{
  position: absolute;
  top: 0;
  left: 0;
  opacity: 0;
}
.wrapper .form .inputfield .check .checkmark{
  width: 15px;
  height: 15px;
  border: 1px solid #EBF4FA;
  display: block;
  position: relative;
}
.wrapper .form .inputfield .check .checkmark:before{
  content: "";
  position: absolute;
  top: 1px;
  left: 2px;
  width: 5px;
  height: 2px;
  border: 2px solid;
  border-color: transparent transparent #fff #fff;
  transform: rotate(-45deg);
  display: none;
}
.wrapper .form .inputfield .check input[type="checkbox"]:checked ~ .checkmark{
  background: #EBF4FA;
}

.wrapper .form .inputfield .check input[type="checkbox"]:checked ~ .checkmark:before{
  display: block;
}

.wrapper .form .inputfield .btn{
  width: 100%;
   padding: 8px 10px;
  font-size: 15px;
  border: 0px;
  background:  #343A40;
  color: #fff;
  cursor: pointer;
  border-radius: 3px;
  outline: none;
}

.wrapper .form .inputfield .btn:hover{
  background: #C0C0C0;
}

.wrapper .form .inputfield:last-child{
  margin-bottom: 0;
}

@media (max-width:420px) {
  .wrapper .form .inputfield{
    flex-direction: column;
    align-items: flex-start;
  }
  .wrapper .form .inputfield label{
    margin-bottom: 5px;
  }
  .wrapper .form .inputfield.terms{
    flex-direction: row;
  }
}
</style>
