
package station;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import dbutils.DBConnection;

import java.util.HashMap;
import java.util.ArrayList;

public class StationController {
    
   Connection con = null;
   PreparedStatement st = null;
   ResultSet rs = null;
    
   
   public StationController(){
       
   }
           
    
    public int saveStation(StationModel station) throws SQLException, ClassNotFoundException {
        
        con=DBConnection.getCon();
        
   
        String sql = "INSERT INTO stations VALUES (?, ?, ?, ?, ?, ?, ?)";
        st = con.prepareStatement(sql);
        st.setString(1, station.getNom());
        st.setFloat(2, station.getCapacite_gasoline());
        st.setFloat(3, station.getCapacite_diesel());
        st.setFloat(4, station.getQte_gal_gasoline());
        st.setFloat(5, station.getQte_gal_diesel());
        st.setFloat(6, station.getPourcentage_util_gasoline());
        st.setFloat(7, station.getPourcentage_util_diesel());
        int n = st.executeUpdate();
        
        return n;

}
   
    
    public ArrayList<StationModel> list() throws ClassNotFoundException, SQLException {
    ArrayList<StationModel> stations = new ArrayList<>();
    StationModel station = null;
    
    String sql = "SELECT * FROM stations";
    
    con = DBConnection.getCon();
    st = con.prepareStatement(sql);
    rs = st.executeQuery();
    
    while (rs.next()) {
        station = new StationModel();
        station.setNom(rs.getString(1));
        station.setCapacite_gasoline(rs.getFloat(2));
        station.setCapacite_diesel(rs.getFloat(3));
        station.setQte_gal_gasoline(rs.getFloat(4));
        station.setQte_gal_diesel(rs.getFloat(5));
        station.setPourcentage_util_gasoline(rs.getFloat(6));
        station.setPourcentage_util_diesel(rs.getFloat(7));
        stations.add(station);
    }
    
    if (rs != null) {
        rs.close();
    }
    if (st != null) {
        st.close();
    }
    if (con != null) {
        con.close();
    }
    
    return stations;
}

    
    
    
    
}

    
    
    

/*


public HashMap<String,StationModel> list() throws ClassNotFoundException, SQLException {
    HashMap<String,StationModel> stations = new HashMap<>();
    StationModel station = new StationModel();
    
    String sql = "SELECT * FROM stations";
    
        con=DBConnection.getCon();
        // passage de la requete a Pre....
        st=con.prepareStatement(sql);
        // 
        rs=st.executeQuery();
        while (rs.next()) {
            //station = new StationModel();
            station.setNom(rs.getString(1));
            station.setCapacite_gasoline(rs.getFloat(2));
            station.setCapacite_diesel(rs.getFloat(3));
            station.setQte_gal_gasoline(rs.getFloat(4));
            station.setQte_gal_diesel(rs.getFloat(5));
            station.setPourcentage_util_gasoline(rs.getFloat(6));
            station.setPourcentage_util_diesel(rs.getFloat(7));
            stations.putIfAbsent(rs.getString(1), station);
        }
        
        if(rs!=null)
            rs.close();
        if(st!=null)
            st.close();
        if(con!=null)
            con.close();
        
        return stations;
    }



*/
    
    
    
    
    
    /*


<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="station.StationModel"%>
<%@page import="station.StationController"%>

<%   
 StationController stc = new StationController();
 StationModel station = new StationModel();
 HashMap<String,StationModel> stations=stc.list();
%>
<%@page import="java.sql.SQLException"%>
<%@page import="dbutils.DBConnection"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Stations List</title>
    </head>
    <body>
        <h1>List of Stations</h1>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Gasoline Capacity</th>
                    <th>Diesel Capacity</th>
                    <th>Gasoline Quantity</th>
                    <th>Diesel Quantity</th>
                    <th>Gasoline Utilization %</th>
                    <th>Diesel Utilization %</th>
                </tr>
            </thead>
            <tbody>
            <% if (stations != null && stations.size() > 0) { %>
            <% for (Map.Entry<String, StationModel> entry : stations.entrySet()) { %>
                <tr>
                    <td><%= entry.getKey() %></td>
                    <td><%= entry.getValue().getCapacite_gasoline() %></td>
                    <td><%= entry.getValue().getCapacite_diesel() %></td>
                    <td><%= entry.getValue().getQte_gal_gasoline() %></td>
                    <td><%= entry.getValue().getQte_gal_diesel() %></td>
                    <td><%= entry.getValue().getPourcentage_util_gasoline() %></td>
                    <td><%= entry.getValue().getPourcentage_util_diesel() %></td>
                </tr>
            <% } %>
        <% } else { %>
            <tr>
                <td colspan="7">No stations found.</td>
            </tr>
        <% } %>
                
                
            </tbody>
        </table>
            
            <%
                   String myVar = (String)request.getAttribute("myVar");
                   out.println(myVar);
            %>

    </body>
</html>




*/
    
    
    

