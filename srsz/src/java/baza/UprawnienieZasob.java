package baza;

import java.util.Date;
import java.sql.Timestamp;
import java.util.List;

public class UprawnienieZasob {
    private int id, tryb;
    private Zasob id_zasob;
    private Uprawnienie id_uprawnienie;
    private Osoby dodane;
    Date data_dodania;
    
    public UprawnienieZasob(){}
    
    public UprawnienieZasob(Zasob idzas, Uprawnienie idupr, Osoby dod, int tr){
        Date data = new Date();
        this.id_zasob = idzas;
        this.id_uprawnienie = idupr;
        this.tryb = tr;
        this.dodane = dod;
        this.data_dodania = new Timestamp(data.getTime());
    }

    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    public Zasob getId_zasob() {
        return id_zasob;
    }

    public String podajTryb(int i){
         if( i ==1) return "Operacje";
            else if (i==11) return "Operacje-Zaoczne";
                else if (i==12) return "Operacje-Stacjonarne";
                    else if (i==2) return "Specjalne";
                        else return "";
     }
    
    
    public void setId_zasob(Zasob id_zasob) {
        this.id_zasob = id_zasob;
    }

    public Uprawnienie getId_uprawnienie() {
        return id_uprawnienie;
    }

    public void setId_uprawnienie(Uprawnienie id_uprawnienie) {
        this.id_uprawnienie = id_uprawnienie;
    }
    
    public int getTryb(){
        return this.tryb;
    }
    
    public void setTryb(int tryb){
        this.tryb = tryb;
    }

    public Osoby getDodane() {
        return dodane;
    }

    public void setDodane(Osoby dodane) {
        this.dodane = dodane;
    }

    public Date getData_dodania() {
        return data_dodania;
    }

    public void setData_dodania(Date data_dodania) {
        this.data_dodania = data_dodania;
    }
    
}
