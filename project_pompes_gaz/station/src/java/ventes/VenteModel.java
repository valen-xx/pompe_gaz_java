
package ventes;



import java.sql.Date;

public class VenteModel {
    private int id;
    private String station;
    private float qte_gal_gasoil;
    private float qte_gal_diesel;
    private Date date_vente;
    private float montant_total;
    
    public VenteModel(){
        
    }

    public VenteModel(int id, String station, float qte_gal_gasoil, float qte_gal_diesel, Date date_vente, float montant_total) {
        this.id = id;
        this.station = station;
        this.qte_gal_gasoil = qte_gal_gasoil;
        this.qte_gal_diesel = qte_gal_diesel;
        this.date_vente = date_vente;
        this.montant_total = montant_total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStation() {
        return station;
    }

    public void setStation(String station) {
        this.station = station;
    }

    public float getQte_gal_gasoil() {
        return qte_gal_gasoil;
    }

    public void setQte_gal_gasoil(float qte_gal_gasoil) {
        this.qte_gal_gasoil = qte_gal_gasoil;
    }

    public float getQte_gal_diesel() {
        return qte_gal_diesel;
    }

    public void setQte_gal_diesel(float qte_gal_diesel) {
        this.qte_gal_diesel = qte_gal_diesel;
    }

    public Date getDate_vente() {
        return date_vente;
    }

    public void setDate_vente(Date date_vente) {
        this.date_vente = date_vente;
    }

    public float getMontant_total() {
        return montant_total;
    }

    public void setMontant_total(float montant_total) {
        this.montant_total = montant_total;
    }
    
       
    
    
}
