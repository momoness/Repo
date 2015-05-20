package baza;

public class Tytuly {
    
    private int id;
    private String tytul;
    
    public Tytuly(){
        
    }
    
    public Tytuly(String tytul){
        this.tytul = tytul;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTytul() {
        return tytul;
    }

    public void setTytul(String tytul) {
        this.tytul = tytul;
    }
    
}
