<%-- 
    Document   : commandecontroller
    Created on : 29 mars 2023, 20 h 28 min 20 s
    Author     : stanley
--%>



<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Date"%>
<%@page import="commandes.CommandeModel"%>
<%@page import="commandes.CommandeController"%>
<%@page import="dbutils.DBConnection"%>
<%@page import="java.util.UUID" %>

<%
   UUID uuid = UUID.randomUUID();
   int id = uuid.hashCode();
   CommandeController cmdCon = new CommandeController();
   CommandeModel commande = new CommandeModel();
   
   commande.setId(id);
   commande.setQteGalDiesel(Float.parseFloat(request.getParameter("qteGalDiesel")));
   commande.setQteGalGasoline(Float.parseFloat(request.getParameter("qteGalGasoline")));
   commande.setDateCommande(new java.sql.Date(new Date().getTime()));
   //commande.setEtat(request.getParameter("EtatCommande"));
   commande.setEtat("N");
  
  
   String message = null;
   try {
       if(cmdCon.saveCommande(commande) >= 1) {
           message = "Enregistrement effectué avec succès !";
       } else {
           message = "Enregistrement non effectué !";
       }
   } catch(SQLException ex) {
       message = "Enregistrement non effectué, cause : " + ex.getMessage();
   }
   request.setAttribute("message", message);
   response.sendRedirect("commandeliste.jsp");
%>
