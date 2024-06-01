<%-- 
    Document   : ventecontroller
    Created on : 30 mars 2023, 02 h 48 min 08 s
    Author     : stanley
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Date"%>
<%@page import="ventes.VenteModel"%>
<%@page import="ventes.VentesController"%>
<%@page import="dbutils.DBConnection"%>
<%@page import="java.util.UUID" %>
<%@ page import="java.sql.*" %>








    
<%
 
   
// Récupération des données du formulaire
    
    String station = request.getParameter("station");
    float qte_gal_gasoil = Float.parseFloat(request.getParameter("qtgaz"));
    float qte_gal_diesel = Float.parseFloat(request.getParameter("qtd"));
    Date date_vente = new Date(); // La date de vente est automatiquement définie comme la date courante
    float montant_total =  qte_gal_gasoil + qte_gal_diesel;

    // Connexion à la base de données
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/pompdb";
    Connection con = DriverManager.getConnection(url, "root", "");
    
    String sql = "INSERT INTO ventes ( station, qte_gal_gasoil, qte_gal_diesel, date_vente, montant_total) VALUES (?, ?, ?, ?, ?)";
    PreparedStatement pstmt = con.prepareStatement(sql);
   
    pstmt.setString(1, station);
    pstmt.setFloat(2, qte_gal_gasoil);
    pstmt.setFloat(3, qte_gal_diesel);
    pstmt.setDate(4, new java.sql.Date(date_vente.getTime())); // conversion de java.util.Date en java.sql.Date
    pstmt.setFloat(5, montant_total);

// Exécution de la requête SQL
    pstmt.executeUpdate();
     response.sendRedirect("venteliste.jsp");
    

// Fermeture de la connexion à la base de données
    con.close();
%>

