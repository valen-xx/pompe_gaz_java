
package commandes;

import java.sql.Date;

public class CommandeModel {
    private int id;
    private float qteGalDiesel;
    private float qteGalGasoline;
    private Date dateCommande;
    private String etat;
    
    public CommandeModel(){
       
    }

    public CommandeModel(int id, float qteGalDiesel, float qteGalGasoline, Date dateCommande, String etat) {
        this.id = id;
        this.qteGalDiesel = qteGalDiesel;
        this.qteGalGasoline = qteGalGasoline;
        this.dateCommande = dateCommande;
        this.etat = etat;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getQteGalDiesel() {
        return qteGalDiesel;
    }

    public void setQteGalDiesel(float qteGalDiesel) {
        this.qteGalDiesel = qteGalDiesel;
    }

    public float getQteGalGasoline() {
        return qteGalGasoline;
    }

    public void setQteGalGasoline(float qteGalGasoline) {
        this.qteGalGasoline = qteGalGasoline;
    }

    public Date getDateCommande() {
        return dateCommande;
    }

    public void setDateCommande(Date dateCommande) {
        this.dateCommande = dateCommande;
    }

    public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }
    
    
}
