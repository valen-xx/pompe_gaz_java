<%-- 
    Document   : mise_a_jour
    Created on : 29 mars 2023, 22 h 44 min 18 s
    Author     : stanley
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" ></script>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Mise à jour</title>
</head>
<body>
	<h1>Mise à jour</h1>
	<%
		try {
			// Récupération des données envoyées par le formulaire
			//int id = Integer.parseInt(request.getParameter("id"));
			String nom = request.getParameter("nom");
			String qtgaz = request.getParameter("qte_gal_gasoline");
			String qtdiesel = request.getParameter("qte_gal_diesel");

			// Connexion à la base de données
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        String url = "jdbc:mysql://localhost:3306/pompdb";
                        Connection con = DriverManager.getConnection(url, "root", "");
			//Class.forName("com.mysql.jdbc.Driver");
			//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ma_base_de_donnees", "utilisateur", "mot_de_passe");

			// Mise à jour de l'enregistrement dans la base de données
                        PreparedStatement pstmt = con.prepareStatement("UPDATE stations SET qte_gal_gasoline=?, qte_gal_diesel=? WHERE nom=?");
			//PreparedStatement pstmt = con.prepareStatement("UPDATE stations SET qte_gal_gasoline=?, qte_gal_diesel=?,  WHERE nom=?");
			//pstmt.setString(1, nom);
			pstmt.setString(1, qtgaz);
			pstmt.setString(2, qtdiesel);
                        pstmt.setString(3, nom);
			
			pstmt.executeUpdate();

			// Fermeture de la connexion à la base de données
			pstmt.close();
			con.close();

			// Redirection vers la page principale
			response.sendRedirect("stationshow.jsp");
		} catch (Exception e) {
			out.println("Erreur : " + e.getMessage());
		}
	%>
</body>
</html>
