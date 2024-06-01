
package station;

public class StationModel {
    private String nom;
    private float capacite_gasoline;
    private float capacite_diesel;
    private float qte_gal_gasoline;
    private float qte_gal_diesel;
    private float pourcentage_util_gasoline;
    private float pourcentage_util_diesel;

    public StationModel() {
    }
    
    
    public StationModel(String nom, float capacite_gasoline, float capacite_diesel, float qte_gal_gasoline, float qte_gal_diesel, float pourcentage_util_gasoline, float pourcentage_util_diesel) {
        this.nom = nom;
        this.capacite_gasoline = capacite_gasoline;
        this.capacite_diesel = capacite_diesel;
        this.qte_gal_gasoline = qte_gal_gasoline;
        this.qte_gal_diesel = qte_gal_diesel;
        this.pourcentage_util_gasoline = pourcentage_util_gasoline;
        this.pourcentage_util_diesel = pourcentage_util_diesel;
    }



    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public float getCapacite_gasoline() {
        return capacite_gasoline;
    }

    public void setCapacite_gasoline(float capacite_gasoline) {
        this.capacite_gasoline = capacite_gasoline;
    }

    public float getCapacite_diesel() {
        return capacite_diesel;
    }

    public void setCapacite_diesel(float capacite_diesel) {
        this.capacite_diesel = capacite_diesel;
    }

    public float getQte_gal_gasoline() {
        return qte_gal_gasoline;
    }

    public void setQte_gal_gasoline(float qte_gal_gasoline) {
        this.qte_gal_gasoline = qte_gal_gasoline;
    }

    public float getQte_gal_diesel() {
        return qte_gal_diesel;
    }

    public void setQte_gal_diesel(float qte_gal_diesel) {
        this.qte_gal_diesel = qte_gal_diesel;
    }

    public float getPourcentage_util_gasoline() {
        return pourcentage_util_gasoline;
    }

    public void setPourcentage_util_gasoline(float pourcentage_util_gasoline) {
        this.pourcentage_util_gasoline = pourcentage_util_gasoline;
    }

    public float getPourcentage_util_diesel() {
        return pourcentage_util_diesel;
    }

    public void setPourcentage_util_diesel(float pourcentage_util_diesel) {
        this.pourcentage_util_diesel = pourcentage_util_diesel;
    }
    
    
}
