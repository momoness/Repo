package baza;

import java.util.Date;
import java.sql.Timestamp;

public class Semestr {
    private int id, rok, plan_gotowy;
    private String typ;
    private Date poczatek, koniec;
    
    public Semestr(){}
    
    public Semestr(String typ, int rok, Date poczatek, Date koniec, int plan){
        Date data = new Date();
        this.typ = typ;
        this.rok = rok;
        this.poczatek = poczatek;
        this.koniec = koniec;
        this.plan_gotowy = plan;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRok() {
        return rok;
    }

    public void setRok(int rok) {
        this.rok = rok;
    }

    public int getPlan_gotowy() {
        return plan_gotowy;
    }

    public void setPlan_gotowy(int plan_gotowy) {
        this.plan_gotowy = plan_gotowy;
    }

    public String getTyp() {
        return typ;
    }

    public void setTyp(String typ) {
        this.typ = typ;
    }

    public Date getPoczatek() {
        return poczatek;
    }

    public void setPoczatek(Date poczatek) {
        this.poczatek = poczatek;
    }

    public Date getKoniec() {
        return koniec;
    }

    public void setKoniec(Date koniec) {
        this.koniec = koniec;
    }
    
    
}