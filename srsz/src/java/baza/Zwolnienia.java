package baza;

import java.util.Date;
import java.sql.Timestamp;

public class Zwolnienia {
    private int id;
    private Osoby id_prac, dodany;
    private Date start, koniec, data_dodania;
    
    public Zwolnienia(){}
    
    public Zwolnienia(Osoby idprac, Date st, Date kon, Osoby dod){
        Date data = new Date();
        this.id_prac = idprac;
        this.start = st;
        this.koniec = kon;
        this.dodany = dod;
        this.data_dodania = new Timestamp(data.getTime());
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Osoby getId_prac() {
        return id_prac;
    }

    public void setId_prac(Osoby id_prac) {
        this.id_prac = id_prac;
    }

    public Osoby getDodany() {
        return dodany;
    }

    public void setDodany(Osoby dodany) {
        this.dodany = dodany;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getKoniec() {
        return koniec;
    }

    public void setKoniec(Date koniec) {
        this.koniec = koniec;
    }

    public Date getData_dodania() {
        return data_dodania;
    }

    public void setData_dodania(Date data_dodania) {
        this.data_dodania = data_dodania;
    }
    
}
