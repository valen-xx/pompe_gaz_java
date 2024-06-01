<%-- 
    Document   : traitement
    Created on : 25 mars 2023, 23 h 17 min 18 s
    Author     : stanley
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="station.StationModel"%>
<%@page import="station.StationController"%>
<%@page import="dbutils.DBConnection"%>


<%
   StationController staCon = new StationController();
   StationModel station=new StationModel();
   station.setNom(request.getParameter("nom"));
   station.setCapacite_gasoline(Float.parseFloat(request.getParameter("capacite_gasoline")));
   station.setCapacite_diesel(Float.parseFloat(request.getParameter("capacite_diesel")));
   station.setQte_gal_gasoline(Float.parseFloat(request.getParameter("qte_gal_gasoline")));
   station.setQte_gal_diesel(Float.parseFloat(request.getParameter("qte_gal_diesel")));
   station.setPourcentage_util_gasoline(Float.parseFloat(request.getParameter("pourcentage_util_gasoline")));
   station.setPourcentage_util_diesel(Float.parseFloat(request.getParameter("pourcentage_util_diesel")));
  
%>

<%
   String message=null;
   try{
    if(staCon.saveStation(station)>=1){
        message="Enregistrement effectue avec succes !";
    }else{
        message="Enregistrement non effectue!";
    }
   }catch(SQLException ex){
        message="Enregistrement non effectue, cause:"+ex.getMessage();
   }
   request.setAttribute("message",message);
   response.sendRedirect("station.jsp");
%>
