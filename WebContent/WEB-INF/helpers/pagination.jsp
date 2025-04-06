<!DOCTYPE html>
<html>
<head>
<style>
.pagination {
  display: inline-block;
margin-left:400px; 
margin-top:40px;  
margin-bottom:-40px;  

 
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  border: 1px solid #ddd;
}

.pagination a.active {
  background-color: lightsteelblue;
  color: white;
  border: 1px solid #EBF4FA;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

.pagination a:first-child {
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
}

.pagination a:last-child {
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
}
</style>
</head>
<body>


<div class="pagination">
  <a href="#">&laquo;</a>
  <a href="#">1</a>
  <a class="active" href="#">2</a>
  <a href="#">3</a>
  <a href="#">4</a>
  <a href="#">5</a>
  <a href="#">6</a>
  <a href="#">&raquo;</a>
</div>

</body>
</html>
<%-- <%-- Formulaire de pagination  --%>
<%-- <!-- <form action="paginationServlet"> --> --%>
<%--   <%-- Affiche les liens de page --%>
<%-- <!-- for (int i = 1; i <= numPages; i++) { %>--> --%>
<%--     <a href="paginationServlet?page=<%= i %>"><%= i %></a> --%>
<%--   <% } %> --%>
<%-- <!-- </form> --> --%>

<%-- <%-- Servlet de pagination  --%>
<%-- <!-- public class PaginationServlet extends HttpServlet { --> --%>
<%-- <!--   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { --> --%>
<%-- <!--     // Récupère la page courante à partir du paramètre de requête --> --%>
<%-- <!--     int page = request.getParameter("page"); --> --%>
<%-- <!--     if (page == null) { --> --%>
<%-- <!--       page = 1; --> --%>
<%-- <!--     } --> --%>

<%-- <!--     // Calcule l'offset à partir de la page courante --> --%>
<%-- <!--     int offset = (page - 1) * RECORDS_PER_PAGE; --> --%>

<%-- <!--     // Exécute la requête de sélection en utilisant une clause LIMIT pour sélectionner uniquement les enregistrements de la page courante --> --%>
<%-- <!--     ResultSet rs = statement.executeQuery("SELECT * FROM records LIMIT " + offset + ", " + RECORDS_PER_PAGE); --> --%>

<%-- <!--     // Stocke les enregistrements de la page courante dans un attribut de requête pour qu'ils puissent être affichés dans la J --> --%>

