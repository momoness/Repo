package baza;

import java.util.Date;

public class SemestrZmiany {
    private int id;
    private Semestr id_semestr;
    private Date dzien,dzien_tygodnia;
    
    public SemestrZmiany(){}
    
    public SemestrZmiany(Semestr id_sem, Date dz, Date dzien_tyg){
        this.id_semestr = id_sem;
        this.dzien = dz;
        this.dzien_tygodnia = dzien_tyg;
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

    public Date getDzien_tygodnia() {
        return dzien_tygodnia; 
    }

    public void setDzien_tygodnia(Date dzien_tygodnia) {
        this.dzien_tygodnia = dzien_tygodnia;
    }

    public Date getDzien() {
        return dzien;
    }

    public void setDzien(Date dzien) {
        this.dzien = dzien;
    }
    
}
