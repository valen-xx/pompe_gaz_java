<%-- 
    Document   : login
    Created on : 22 mars 2023, 14 h 08 min 15 s
    Author     : stanley
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.sql.*" %>

<%
// Vérification des identifiants de connexion
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null) {
        // Vérification des identifiants dans la base de données
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pompdb", "root", "");
        String sql = "SELECT * FROM utilisateurs WHERE username = ? AND password = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            // Identifiants corrects, l'utilisateur est connecté
            session.setAttribute("username", username);
            response.sendRedirect("index.jsp");
        } else {
            // Identifiants incorrects, affichage d'un message d'erreur
            out.println("<p>Identifiants incorrects. Veuillez réessayer.</p>");
        }

        conn.close();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Espace de connexion</h1>
        <hr>
        
        
    <form action="login.jsp" method="post">
        <label for="username">Nom d'utilisateur :</label>
        <input type="text" id="username" name="username" required><br>
        <label for="password">Mot de passe :</label>
        <input type="password" id="password" name="password" required><br>
        <input type="submit" value="Se connecter">
    </form>
     
        <a href="register.jsp">creer votre compte</a>
        
    </body>
</html>
