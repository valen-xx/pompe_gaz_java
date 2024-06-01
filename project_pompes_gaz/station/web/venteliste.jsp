<%-- 
    Document   : venteliste
    Created on : 30 mars 2023, 03 h 07 min 40 s
    Author     : stanley
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ventes.VenteModel"%>
<%@page import="ventes.VentesController"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dbutils.DBConnection"%>

<%   
   VentesController cmdc = new VentesController();
    ArrayList<VenteModel> commandes = cmdc.listCommandes();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" ></script>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>List of VENTE</title>
        <title>JSP Page</title>
    </head>
    
     <nav class="navbar navbar-expand-lg bg-body-tertiary bg-dark" data-bs-theme="dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Navbar</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
          <a class="nav-link" href="ventes.jsp">enregistrer une vente</a>
          <a class="nav-link" href="venteliste.jsp">Afficher les vente</a>
          
        </div>
      </div>
    </div>
    </nav>
    <body>
        <h1>liste vente!</h1>
        
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">NOM STATION</th>
                    <th scope="col">QTE GALLON DIESEL</th>
                    <th scope="col">QTE GALLON GAZOLINE</th>
                    <th scope="col">DATE</th>
                    <th scope="col">MONTANT</th>
                </tr>
            </thead>
            <tbody>
                <% if (commandes != null && !commandes.isEmpty()) { %>
                    <% for (VenteModel commande : commandes) { %>
                        <tr>
                            <td><%= commande.getId() %></td>
                            <td><%= commande.getStation()%></td>
                            <td><%= commande.getQte_gal_diesel()%></td>
                            <td><%= commande.getQte_gal_gasoil() %></td>
                            <td><%= commande.getDate_vente() %></td>
                            <td><%= commande.getMontant_total()%></td>
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
