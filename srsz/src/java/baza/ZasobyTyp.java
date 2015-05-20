package baza;

public class ZasobyTyp {
    private int id;
    private String opis;
    
    public ZasobyTyp(){}
    
    public ZasobyTyp(String op){
        this.opis = op;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }
    
}
