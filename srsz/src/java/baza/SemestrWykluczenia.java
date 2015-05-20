package baza;

import java.util.Date;

public class SemestrWykluczenia {
    private int id;
    private Semestr id_semestr;
    private Date dzien;
    private Date  koniec;
    private Date poczatek;
    private String opis;
    
    public SemestrWykluczenia(){}
    
    public SemestrWykluczenia(Semestr id_semestr, Date dzien, Date poczatek, Date koniec, String opis){
        this.id_semestr = id_semestr;
        this.dzien = dzien;
        this.poczatek = poczatek;
        this.koniec = koniec;
        this.opis = opis; 
    }

    public Semestr getId_semestr() {
        return id_semestr;
    }

    public void setId_semestr(Semestr id_semestr) {
        this.id_semestr = id_semestr;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDzien() {
        return dzien;
    }

    public void setDzien(Date dzien) {
        this.dzien = dzien;
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

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    
}
