package baza;

import java.util.Date;
import java.sql.Timestamp;
import java.util.List;

public class UprawnienieOsoba {
    private int id;
    private Osoby id_prac, dodany;
    private Uprawnienie id_uprawnienie;
    Date data_dodania;
    
    public UprawnienieOsoba(){}
    
    public UprawnienieOsoba(Osoby idprac, Uprawnienie idupr, Osoby dod){
        Date data = new Date();
        this.id_prac = idprac;
        this.id_uprawnienie = idupr;
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

    public Uprawnienie getId_uprawnienie() {
        return id_uprawnienie;
    }

    public void setId_uprawnienie(Uprawnienie id_uprawnienie) {
        this.id_uprawnienie = id_uprawnienie;
    }

    public Osoby getDodany() {
        return dodany;
    }

    public void setDodany(Osoby dodany) {
        this.dodany = dodany;
    }

    public Date getData_dodania() {
        return data_dodania;
    }

    public void setData_dodania(Date data_dodania) {
        this.data_dodania = data_dodania;
    }
    
}
