package baza;

import java.util.Date;
import java.sql.Timestamp;
import java.text.Format;
import java.text.SimpleDateFormat;
import org.json.simple.JSONObject;

public class Prosba {
    private int id;
    private Osoby wlasciciel;
    private Date data_utworzenia;
    private String powod;
    private Date start, koniec;
    private Zasob id_zasob;
    private RezerwacjaTyp typ;    
    
    public Prosba(){}
    
    public Prosba(Osoby wlasciciel, String powod, Date start, Date koniec, Zasob id_zasob, RezerwacjaTyp typ){
        Date data = new Date();
        this.wlasciciel = wlasciciel;
        this.data_utworzenia = new Timestamp(data.getTime());
        this.powod = powod;
        this.start = start;
        this.koniec = koniec;
        this.id_zasob = id_zasob;
        this.typ = typ;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Osoby getWlasciciel() {
        return wlasciciel;
    }

    public void setWlasciciel(Osoby wlasciciel) {
        this.wlasciciel = wlasciciel;
    }

    public Date getData_utworzenia() {
        return data_utworzenia;
    }

    public void setData_utworzenia(Date data_utworzenia) {
        this.data_utworzenia = data_utworzenia;
    }

    public String getPowod() {
        return powod;
    }

    public void setPowod(String powod) {
        this.powod = powod;
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
    
    public Zasob getId_zasob() {
        return id_zasob;
    }

    public void setId_zasob(Zasob id_zasob) {
        this.id_zasob = id_zasob;
    }
    
    public RezerwacjaTyp getTyp() {
        return typ;
    }

    public void setTyp(RezerwacjaTyp typ) {
        this.typ = typ;
    }
    
    @Override public String toString(){
        JSONObject obj = new JSONObject();
        Format sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String s,k;
        s = sdf.format(start);
        k = sdf.format(koniec);
        Integer zas = this.id_zasob.getId();
        String zId = zas.toString();
        Integer tenId = this.id;
        String tenId_ = tenId.toString();
        Integer tenTyp = this.typ.getId();
        String tenTyp_ = tenTyp.toString();
        Integer wlasc = this.wlasciciel.getId();
        Integer prosba = 1;
               
        obj.put("start",s);
        obj.put("end",k);
        obj.put("title",powod);
        obj.put("id_zasob",zId);
        obj.put("id",tenId_);
        obj.put("typ",tenTyp_);
        obj.put("wlasciciel",wlasc);
        obj.put("prosba",prosba);
        return obj.toJSONString();
    }
}
