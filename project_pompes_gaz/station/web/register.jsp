<%-- 
    Document   : register
    Created on : 24 mars 2023, 12 h 47 min 00 s
    Author     : stanley
--%>

<%@ page import="java.sql.*" %>

<%
// Vérification des données d'inscription
String username = request.getParameter("username");
String password = request.getParameter("password");

if (username != null && password != null) {
    // Vérification de l'existence de l'utilisateur dans la base de données
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pompdb", "root", "");
    //String sql = "SELECT * FROM utilisateurs WHERE username = ? AND password = ?";
    //Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ma_base_de_donnees", "mon_utilisateur", "mon_mot_de_passe");
    String sql = "SELECT * FROM utilisateurs WHERE username = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, username);
    ResultSet rs = pstmt.executeQuery();
    
    if (rs.next()) {
        // L'utilisateur existe déjà, affichage d'un message d'erreur
        out.println("<p>Ce nom d'utilisateur est déjà utilisé. Veuillez choisir un autre nom d'utilisateur.</p>");
    } else {
        // L'utilisateur n'existe pas, insertion dans la base de données
        String sql_insert = "INSERT INTO utilisateurs (username, password) VALUES (?, ?)";
        PreparedStatement pstmt_insert = conn.prepareStatement(sql_insert);
        pstmt_insert.setString(1, username);
        pstmt_insert.setString(2, password);
        pstmt_insert.executeUpdate();
        
        // Affichage d'un message de confirmation
        out.println("<p>Votre compte a été créé avec succès.</p>");
    }
    
    conn.close();
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    
        <h1>Enregistrer</h1>

    <form action="register.jsp" method="post">
        <label for="username">Nom d'utilisateur :</label>
        <input type="text" id="username" name="username" required><br>
        <label for="password">Mot de passe :</label>
        <input type="password" id="password" name="password" required><br>
        <input type="submit" value="S'inscrire">
    </form>
    </body>
</html>
