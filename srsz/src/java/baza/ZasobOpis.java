package baza;

public class ZasobOpis {
    private int id, ilosc;
    private Zasob id_zasob;
    private String opis;
    
    public ZasobOpis(){}
    
    public ZasobOpis(Zasob idzas, int il, String op){
        this.id_zasob = idzas;
            this.ilosc = il;
        this.opis = op;
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

    public void setId_zasob(Zasob id_zasob) {
        this.id_zasob = id_zasob;
    }


    public int getIlosc() {
        return ilosc;
    }

    public void setIlosc(int ilosc) {
        this.ilosc = ilosc;
    }

    

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }
    
    
}
