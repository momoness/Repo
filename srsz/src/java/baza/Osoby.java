package baza;

import java.util.Date;
import java.sql.Timestamp;

public class Osoby {
    private int id;
    private String imie;
    private String nazwisko;
    private Tytuly tytul;
    private String login;
    private String email;
    private String telefon;
    private int dodany;
    private Date data_dodania;
    private Integer edytowany;
    private Date data_edycji;
    
    public Osoby(){}
    
    public Osoby(String im, String naz, Tytuly tyt, String idprac, 
            String mail, String tel, int dod){
        this.imie = im;
        this.nazwisko = naz;
        this.tytul = tyt;
        this.login = idprac;
        this.email = mail;
        this.telefon = tel;
        this.dodany = dod;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImie() {
        return imie;
    }

    public void setImie(String imie) {
        this.imie = imie;
    }

    public String getNazwisko() {
        return nazwisko;
    }

    public void setNazwisko(String nazwisko) {
        this.nazwisko = nazwisko;
    }

    public Tytuly getTytul() {
        return tytul;
    }

    public void setTytul(Tytuly tytul) {
        this.tytul = tytul;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefon() {
        return telefon;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    public int getDodany() {
        return dodany;
    }

    public void setDodany(int dodany) {
        this.dodany = dodany;
    }

    public Date getData_dodania() {
        return data_dodania;
    }

    public void setData_dodania(Date data_dodania) {
        this.data_dodania = data_dodania;
    }

    public Integer getEdytowany() {
        return edytowany;
    }

    public void setEdytowany(Integer edytowany) {
        this.edytowany = edytowany;
    }

    public Date getData_edycji() {
            return data_edycji;
    }

    public void setData_edycji(Date data_edycji) {
        this.data_edycji = data_edycji;
    }
    
    
}
