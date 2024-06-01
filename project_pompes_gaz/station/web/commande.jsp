<%-- 
    Document   : commande
    Created on : 29 mars 2023, 20 h 16 min 55 s
    Author     : stanley
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" ></script>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>commande</title>
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
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
          <a class="nav-link" href="commande.jsp">enregistre commande</a>
          <a class="nav-link" href="commandeliste.jsp">afficher Commandes</a>
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
       
       <div class="mb-3">
        <form method="post" action="commandecontroller.jsp" >
            <div class="mb-3">
                <label for="qteGalDiesel" class="form-label">Quantité de diesel:</label>
                <input type="number" id="qteGalDiesel" class="form-control" name="qteGalDiesel" required><br><br>
            </div>
            
            <div class="mb-3">
                <label for="qteGalGasoline" class="form-label">Quantité de gasoline:</label>
                <input type="number" id="qteGalGasoline" class="form-control" name="qteGalGasoline" required><br><br>
            </div>
            
            <div class="mb-3">
                <label for="dateCommande" class="form-label">Date de la commande:</label>
                <input type="date" id="dateCommande" class="form-control" name="dateCommande" required><br><br>
            </div>
            
            <div class="mb-3">
                <label for="EtatCommande" class="form-label">etat de la commande:</label>
                <input type="text" id="EtatCommande" class="form-control" name="EtatCommande" value="N" required><br><br>
            </div>
            



            <input type="submit" value="envoyer" class="btn btn-primary">
         </form>
        </div>
    </body>
</html>
