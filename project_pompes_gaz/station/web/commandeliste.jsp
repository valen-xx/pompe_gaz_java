<%-- 
    Document   : commandeliste
    Created on : 29 mars 2023, 20 h 33 min 29 s
    Author     : stanley
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="commandes.CommandeModel"%>
<%@page import="commandes.CommandeController"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dbutils.DBConnection"%>

<%   
    CommandeController cmdc = new CommandeController();
    ArrayList<CommandeModel> commandes = cmdc.listCommandes();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" ></script>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>List of Commandes</title>
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
        <h1>List of Commandes</h1>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Quantity of Diesel (gallons)</th>
                    <th scope="col">Quantity of Gasoline (gallons)</th>
                    <th scope="col">Date of Commande</th>
                    <th scope="col">Etat</th>
                </tr>
            </thead>
            <tbody>
                <% if (commandes != null && !commandes.isEmpty()) { %>
                    <% for (CommandeModel commande : commandes) { %>
                        <tr>
                            <td><%= commande.getId() %></td>
                            <td><%= commande.getQteGalDiesel() %></td>
                            <td><%= commande.getQteGalGasoline() %></td>
                            <td><%= commande.getDateCommande() %></td>
                            <td><%= commande.getEtat() %></td>
                        </tr>
                    <% } %>
                <% } else { %>
                    <tr>
                        <td colspan="5">No commandes found.</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </body>
</html>
