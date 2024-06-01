<%-- 
    Document   : stationsedit
    Created on : 24 mars 2023, 15 h 57 min 59 s
    Author     : stanley
--%>

<%@ page import="java.sql.*" %>

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
        <title>modifier</title>
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
		<%
			try {
				// Connexion à la base de données
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                String url = "jdbc:mysql://localhost:3306/pompdb";
                                Connection con = DriverManager.getConnection(url, "root", "");
				//Class.forName("com.mysql.jdbc.Driver");
				//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pompdb", "root", "mot_de_passe");
				//Statement stmt = con.createStatement();
                                Statement stmt = con.createStatement();

				// Récupération des données de la table
				ResultSet rs = stmt.executeQuery("SELECT * FROM stations");

				// Affichage des données dans la table
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>" + rs.getString("nom") + "</td>");
					out.println("<td>" + rs.getFloat("capacite_gasoline") + "</td>");
					out.println("<td>" + rs.getFloat("capacite_diesel") + "</td>");
					out.println("<td>" + rs.getFloat("qte_gal_gasoline") + "</td>");
                                        out.println("<td>" + rs.getFloat("qte_gal_diesel") + "</td>");
                                        out.println("<td>" + rs.getFloat("pourcentage_util_gasoline") + "</td>");
                                        out.println("<td>" + rs.getFloat("pourcentage_util_diesel") + "</td>");
                                        
					out.println("</tr>");
				}

				// Fermeture de la connexion à la base de données
				rs.close();
				stmt.close();
				con.close();
			} catch (Exception e) {
				out.println("Erreur : " + e.getMessage());
			}
		%>
	</table>
        
        
        <div class="mb-3">
        <form method="post" action="mise_a_jour.jsp">
		<p>Nom de l'enregistrement à mettre à jour : <input type="text" name="nom"></p>
		<p>Nouveau qte gallon de gazoline : <input type="text" name="qte_gal_gasoline"></p>
		<p>Nouveau qte gallon de diesel : <input type="text" name="qte_gal_diesel"></p>
		
		<input type="submit" value="Mettre à jour">
	</form>
        </div>

    </body>
</html>
