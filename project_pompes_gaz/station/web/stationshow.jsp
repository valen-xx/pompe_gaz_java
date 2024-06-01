<%-- 
    Document   : stationshow
    Created on : 24 mars 2023, 15 h 48 min 38 s
    Author     : stanley
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="station.StationModel"%>
<%@page import="station.StationController"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dbutils.DBConnection"%>

<%   
 StationController stc = new StationController();
 ArrayList<StationModel> stations = stc.list();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" ></script>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Toutes les station</title>
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
          <a class="nav-link" href="stationsave.jsp">Enregistre une station</a>
          <a class="nav-link" href="stationshow.jsp">Affichez les station</a>
          <a class="nav-link" href="stationedit.jsp">modifer la qte diesel ou de gazoline</a>
        </div>
      </div>
    </div>
    </nav>
        
        
    <table class="table">
    <thead>
      <tr>

        
        <th scope="col">Name</th>
        <th scope="col">Gasoline Capacity</th>
        <th scope="col">Diesel Capacity</th>
        <th scope="col">Gasoline Quantity</th>
        <th scope="col">Diesel Quantity</th>
        <th scope="col">Gasoline Utilization %</th>
        <th scope="col">Diesel Utilization %</th>
    </tr>
  </thead>
  <tbody>
      <% if (stations != null && stations.size() > 0) { %>
            <% for (StationModel station : stations) { %>
                <tr>
                    <td><%= station.getNom() %></td>
                    <td><%= station.getCapacite_gasoline() %></td>
                    <td><%= station.getCapacite_diesel() %></td>
                    <td><%= station.getQte_gal_gasoline() %></td>
                    <td><%= station.getQte_gal_diesel() %></td>
                    <td><%= station.getPourcentage_util_gasoline() %></td>
                    <td><%= station.getPourcentage_util_diesel() %></td>
                </tr>
            <% } %>
            <% } else { %>
            <tr>
                <td colspan="7">No stations found.</td>
            </tr>
            <% } %>
    
  </tbody>
</table>
    </body>
</html>
