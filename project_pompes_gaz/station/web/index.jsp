<%-- 
    Document   : index
    Created on : 22 mars 2023, 13 h 03 min 46 s
    Author     : stanley
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" ></script>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Liste des station</title>
    </head>
    <body>
    
    <nav class="navbar navbar-expand-lg bg-body-tertiary bg-dark" data-bs-theme="dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Navbar</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
          <a class="nav-link" href="station.jsp">Station</a>
          <a class="nav-link" href="commande.jsp">Commandes</a>
          <a class="nav-link" href="ventes.jsp">Ventes</a>
  
           <%
            String username = (String) session.getAttribute("username");
            if (username != null) {
        %>
                <li><a href="logout.jsp">Logout</a></li>
        <%-- Si l'utilisateur est connecté, ajouter un lien pour se déconnecter --%>
        <% } else { %>
                <li><a href="login.jsp">Login</a></li>
        <%-- Sinon, ajouter un lien pour se connecter --%>
        <% } %>
        </div>
      </div>
    </div>
    </nav>
        
        
        <div>
            <h1>Liste des station</h1>
             <a href="station.jsp"> cliquez</a>
            <h1>Liste des comande</h1>
             <a href="login.jsp"> cliquez</a>
            <h1>Liste des ventes</h1>
             <a href="login.jsp"> cliquez</a>
        </div>
    </body>
</html>
