package baza;


public class RezerwacjaTyp {
    private int id;
    private String opis;
    
    public RezerwacjaTyp(){
    
    }
    
    public RezerwacjaTyp(String opis){
        this.opis = opis;
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
