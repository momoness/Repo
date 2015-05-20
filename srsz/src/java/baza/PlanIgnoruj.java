package baza;

import java.util.Date;
import java.sql.Timestamp;

public class PlanIgnoruj {
    private int id;
    private Semestr id_semestr;
    private Date dzien;
    private Rezerwacja zajecia_id;
    private String opis;
    private Osoby dodany;
    private Date data_utworzenia;
    
    public PlanIgnoruj(){}
    
    public PlanIgnoruj(Semestr id_semestr,Date dzien, Rezerwacja zajecia_id, String opis, Osoby dodany){
        Date data = new Date();
        this.id_semestr = id_semestr;
        this.dzien = dzien;
        this.zajecia_id = zajecia_id;
        this.opis = opis;
        this.dodany = dodany;
        this.data_utworzenia = new Timestamp(data.getTime());
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Semestr getId_semestr() {
        return id_semestr;
    }

    public void setId_semestr(Semestr id_semestr) {
        this.id_semestr = id_semestr;
    }

    public Date getDzien() {
        return dzien;
    }

    public void setDzien(Date dzien) {
        this.dzien = dzien;
    }

    public Rezerwacja getZajecia_id() {
        return zajecia_id;
    }

    public void setZajecia_id(Rezerwacja zajecia_id) {
        this.zajecia_id = zajecia_id;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public Osoby getDodany() {
        return dodany;
    }

    public void setDodany(Osoby dodany) {
        this.dodany = dodany;
    }

    public Date getData_utworzenia() {
        return data_utworzenia;
    }

    public void setData_utworzenia(Date data_utworzenia) {
        this.data_utworzenia = data_utworzenia;
    }
    
    
}
