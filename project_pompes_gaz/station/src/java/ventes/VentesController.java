/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ventes;

/**
 *
 * @author stanley
 * 
 * 
 */

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import dbutils.DBConnection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

public class VentesController {
    Connection con = null;
    PreparedStatement st = null;
    ResultSet rs = null;
    
    
    public int Save(VenteModel vnts) throws SQLException, ClassNotFoundException {
        con = DBConnection.getCon();
        String sql = "INSERT INTO stations (station, qte_gal_gasoil,qte_gal_diesel,date_vente ,montant_total) VALUES (?, ?, ?, ?, ?)";
        st = con.prepareStatement(sql);
        st.setString(1, vnts.getStation());
        st.setFloat(2, vnts.getQte_gal_gasoil());
        st.setFloat(3, vnts.getQte_gal_diesel());
        st.setDate(4, vnts.getDate_vente());
        st.setFloat(5, vnts.getMontant_total());

        int n = st.executeUpdate();
        return n;
    }
   
    
    public ArrayList<VenteModel> listCommandes() throws ClassNotFoundException, SQLException {
    ArrayList<VenteModel> ventes = new ArrayList<>();
    VenteModel vts;

    String sql = "SELECT * FROM ventes";

    con = DBConnection.getCon();
    st = con.prepareStatement(sql);
    rs = st.executeQuery();

    while (rs.next()) {
        vts = new VenteModel();
        vts.setId(rs.getInt(1));
        vts.setStation(rs.getString(2));
        vts.setQte_gal_gasoil(rs.getFloat(3));
        vts.setQte_gal_diesel(rs.getFloat(4));
        vts.setDate_vente(rs.getDate(5));
        vts.setMontant_total(rs.getFloat(6));

        ventes.add(vts);
    }

    if (rs != null)
        rs.close();
    if (st != null)
        st.close();
    if (con != null)
        con.close();

    return ventes; 
    
    }
}
