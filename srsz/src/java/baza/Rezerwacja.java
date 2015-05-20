package baza;


import static java.lang.System.out;
import java.util.Date;
import java.sql.Timestamp;
import java.text.Format;
import java.text.SimpleDateFormat;
import org.json.simple.JSONObject;

public class Rezerwacja {
    private int id;
    private RezerwacjaTyp typ;
    private Osoby wlasciciel, rezerwujacy, edytujacy;
    private Integer powiazany;
    private Zasob id_zasob;
    private Date dzien, data_utworzenia, data_edycji;
    private Date start,koniec;
    private String opis;
    private Kierunek kierunek;

    public Kierunek getKierunek() {
        return kierunek;
    }

    public void setKierunek(Kierunek kierunek) {
        this.kierunek = kierunek;
    }
    
    public Rezerwacja(){}
    
    public Rezerwacja(Date start, Date koniec, String opis_,RezerwacjaTyp typ, 
            Osoby wlasciciel, Osoby rezerwujacy, Zasob id_zasob, 
            Integer powiazany, Kierunek kierunek){
        Date data = new Date();
        //this.dzien = dzien;
        this.start = start;
        this.koniec = koniec;
        this.opis = opis_;
        this.typ = typ;
        this.wlasciciel = wlasciciel;
        this.rezerwujacy = rezerwujacy;
        this.data_utworzenia = new Timestamp(data.getTime());
        this.id_zasob = id_zasob;
        this.powiazany = powiazany; 
        this.kierunek = kierunek;
    }
    public Rezerwacja(Date start, Date koniec, String opis_,RezerwacjaTyp typ, 
            Osoby wlasciciel, Osoby rezerwujacy, Zasob id_zasob){
        Date data = new Date();
        //this.dzien = dzien;
        this.start = start;
        this.koniec = koniec;
        this.opis = opis_;
        this.typ = typ;
        this.wlasciciel = wlasciciel;
        this.rezerwujacy = rezerwujacy;
        this.data_utworzenia = new Timestamp(data.getTime());
        this.id_zasob = id_zasob;
        
    }
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the typ
     */
    public RezerwacjaTyp getTyp() {
        return typ;
    }

    /**
     * @param typ the typ to set
     */
    public void setTyp(RezerwacjaTyp typ) {
        this.typ = typ;
    }

    /**
     * @return the wlasciciel
     */
    public Osoby getWlasciciel() {
        return wlasciciel;
    }

    /**
     * @param wlasciciel the wlasciciel to set
     */
    public void setWlasciciel(Osoby wlasciciel) {
        this.wlasciciel = wlasciciel;
    }

    /**
     * @return the rezerwujacy
     */
    public Osoby getRezerwujacy() {
        return rezerwujacy;
    }

    /**
     * @param rezerwujacy the rezerwujacy to set
     */
    public void setRezerwujacy(Osoby rezerwujacy) {
        this.rezerwujacy = rezerwujacy;
    }

    /**
     * @return the id_zasob
     */
    public Zasob getId_zasob() {
        return id_zasob;
    }

    /**
     * @param id_zasob the id_zasob to set
     */
    public void setId_zasob(Zasob id_zasob) {
        this.id_zasob = id_zasob;
    }

    /**
     * @return the powiazany
     */
    public Integer getPowiazany() {
        return powiazany;
    }

    /**
     * @param powiazany the powiazany to set
     */
    public void setPowiazany(Integer powiazany) {
        this.powiazany = powiazany;
    }

    /**
     * @return the edytujacy
     */
    public Osoby getEdytujacy() {
        return edytujacy;
    }

    /**
     * @param edytujacy the edytujacy to set
     */
    public void setEdytujacy(Osoby edytujacy) {
        this.edytujacy = edytujacy;
    }

    /**
     * @return the dzien
     
    public Date getDzien() {
        return dzien;
    }
*/
    /**
     * @param dzien the dzien to set
     
    public void setDzien(Date dzien) {
        this.dzien = dzien;
    }
*/
    /**
     * @return the data_utworzenia
     */
    public Date getData_utworzenia() {
        return data_utworzenia;
    }

    /**
     * @param data_utworzenia the data_utworzenia to set
     */
    public void setData_utworzenia(Date data_utworzenia) {
        this.data_utworzenia = data_utworzenia;
    }

    /**
     * @return the data_edycji
     */
    public Date getData_edycji() {
        return data_edycji;
    }

    /**
     * @param data_edycji the data_edycji to set
     */
    public void setData_edycji(Date data_edycji) {
        this.data_edycji = data_edycji;
    }

    /**
     * @return the start
     */
    public Date getStart() {
        return start;
    }

    /**
     * @param start the start to set
     */
    public void setStart(Date start) {
        this.start = start;
    }

    /**
     * @return the koniec
     */
    public Date getKoniec() {
        return koniec;
    }

    /**
     * @param koniec the koniec to set
     */
    public void setKoniec(Date koniec) {
        this.koniec = koniec;
    }

    /**
     * @return the opis
     */
    public String getOpis() {
        return opis;
    }

    /**
     * @param opis the opis to set
     */
    public void setOpis(String opis) {
        this.opis = opis;
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
        Integer pow = this.getPowiazany();
        Integer prosba = 0;
               
        obj.put("start",s);
        obj.put("end",k);
        obj.put("title",opis);
        obj.put("id_zasob",zId);
        obj.put("id",tenId_);
        obj.put("typ",tenTyp_);
        obj.put("wlasciciel",wlasc);
        obj.put("prosba",prosba);
         obj.put("powiazany",pow);
         obj.put("kierunek", this.kierunek.getId());
         obj.put("typString",typ.getOpis());
         obj.put("wlascicielString", wlasciciel.getTytul().getTytul()+" "+wlasciciel.getNazwisko()+" "+wlasciciel.getImie());
        
        return obj.toJSONString();
    }
    

} 