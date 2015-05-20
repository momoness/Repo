
package baza;


public class Kierunek {
    
    private int id;
    private String nazwa, kod;
    
    public Kierunek(){
        
    }
    
    public Kierunek(String naz){
        this.nazwa = naz;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNazwa() {
        return nazwa;
    }

    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }
    public void setKod(String kod){
        this.kod = kod;
    }
    public String getKod(){
        return this.kod;
    }
}
