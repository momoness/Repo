package baza;

import static java.lang.System.out;
import java.util.Date;
import java.sql.Timestamp;

public class Uprawnienie {
    private int id;
    private Osoby dodany;
    private String opis;
    private Date obowiazuje_od, obowiazuje_do, data_dodania;
    
    public Uprawnienie(){}
    
    public Uprawnienie(String op, Date od, Date do_, Osoby dod){;
        this.opis = op;
        this.obowiazuje_od = od;
        this.obowiazuje_do = do_;
        this.dodany = dod;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Osoby getDodany() {
        return dodany;
    }

    public void setDodany(Osoby dodany) {
        this.dodany = dodany;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public Date getObowiazuje_od() {
        return obowiazuje_od;
    }

    public void setObowiazuje_od(Date obowiazuje_od) {
        this.obowiazuje_od = obowiazuje_od;
    }

    public Date getObowiazuje_do() {
        return obowiazuje_do;
    }

    public void setObowiazuje_do(Date obowiazuje_do) {
        this.obowiazuje_do = obowiazuje_do;
    }

    public Date getData_dodania() {
        return data_dodania;
    }

    public void setData_dodania(Date data_dodania) {
        this.data_dodania = data_dodania;
    }
    
}
