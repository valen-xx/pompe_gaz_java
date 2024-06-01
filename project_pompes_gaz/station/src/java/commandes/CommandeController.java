
package commandes;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import dbutils.DBConnection;
import java.util.ArrayList;
import java.util.HashMap;

public class CommandeController {
         Connection con = null;
         PreparedStatement st = null;
         ResultSet rs = null;
    
    
         
    public CommandeController(){
        
    }     
         
         
    public int saveCommande(CommandeModel commande) throws SQLException, ClassNotFoundException {
    con = DBConnection.getCon();
    String sql = "INSERT INTO commandes VALUES (?, ?, ?, ? )";
    st = con.prepareStatement(sql);
    //st.setInt(1, commande.getId());
    st.setFloat(1, commande.getQteGalGasoline());
    st.setFloat(2, commande.getQteGalDiesel());
    st.setDate(3, commande.getDateCommande());
    st.setString(4, commande.getEtat());
    int n = st.executeUpdate();
    return n;
}

    
    
    
    public ArrayList<CommandeModel> listCommandes() throws ClassNotFoundException, SQLException {
    ArrayList<CommandeModel> commandes = new ArrayList<>();
    CommandeModel commande;

    String sql = "SELECT * FROM commandes";

    con = DBConnection.getCon();
    st = con.prepareStatement(sql);
    rs = st.executeQuery();

    while (rs.next()) {
        commande = new CommandeModel();
        commande.setId(rs.getInt(1));
        commande.setQteGalDiesel(rs.getFloat(2));
        commande.setQteGalGasoline(rs.getFloat(3));
        commande.setDateCommande(rs.getDate(4));
        commande.setEtat(rs.getString(5));

        commandes.add(commande);
    }

    if (rs != null)
        rs.close();
    if (st != null)
        st.close();
    if (con != null)
        con.close();

    return commandes;
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
}



/*

    public HashMap<Integer, CommandeModel> listCommandes() throws ClassNotFoundException, SQLException {
    HashMap<Integer, CommandeModel> commandes = new HashMap<>();
    CommandeModel commande;
    
    String sql = "SELECT * FROM commandes";
    
    con = DBConnection.getCon();
    st = con.prepareStatement(sql);
    rs = st.executeQuery();
    
    while (rs.next()) {
        commande = new CommandeModel();
        commande.setId(rs.getInt(1));
        commande.setQteGalDiesel(rs.getFloat(2));
        commande.setQteGalGasoline(rs.getFloat(3));
        commande.setDateCommande(rs.getDate(4));
        commande.setEtat(rs.getString(5));
        
        commandes.putIfAbsent(commande.getId(), commande);
    }
    
    if (rs != null)
        rs.close();
    if (st != null)
        st.close();
    if (con != null)
        con.close();
    
    return commandes;
}



*/