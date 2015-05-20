package baza;

import java.sql.Timestamp;
import java.util.Date;

public class Zasob {
    private int id;
    private ZasobyTyp id_typ;
    private SalaTyp id_sala;
    
    private String nazwa;
    private Osoby dodany;
    private Date data_dodania;
    private Osoby edytowany;
    private Date data_edycji;
    
    public Zasob(){}
    
    public Zasob(ZasobyTyp idtyp, SalaTyp idsala, String naz, Osoby dod){
        Date data = new Date();
        this.id_typ = idtyp;
        this.id_sala = idsala;
        this.nazwa = naz;
        this.dodany = dod;
        this.data_dodania = new Timestamp(data.getTime());
        this.data_edycji = null;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ZasobyTyp getId_typ() {
        return id_typ;
    }

    public void setId_typ(ZasobyTyp id_typ) {
        this.id_typ = id_typ;
    }
    
    public SalaTyp getId_sala() {
        return id_sala;
    }

  public void setId_sala(SalaTyp id_sala) {
        this.id_sala = id_sala;
    }
   
    public String getNazwa() {
        return nazwa;
    }

    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
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

    public Osoby getEdytowany() {
        return edytowany;
    }

    public void setEdytowany(Osoby edytowany) {
        this.edytowany = edytowany;
    }

    public Date getData_edycji() {
        return data_edycji;
    }

    public void setData_edycji(Date data_edycji) {
        this.data_edycji = data_edycji;
    }
}