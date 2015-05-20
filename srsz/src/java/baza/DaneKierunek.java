package baza;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class DaneKierunek {
    Kierunek k;
    private static HibernateUtil helper;
    private static Session session;
    
    public void dodajKierunek(String nowy){
        k = new Kierunek(nowy);
        session = helper.getSession();
        session.beginTransaction();
        session.save(k);
        session.getTransaction().commit();
        
    }
    
    public static Kierunek zczytajKierunek(int id){
        Kierunek wyjscie = new Kierunek();
        session = helper.getSession();
       
        wyjscie = (Kierunek) session.get(Kierunek.class, id);
        
        return wyjscie;
    }
    
    public static List<Kierunek> selectKierunek()
    {
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Kierunek ");
        return select.list();
    }
    public String selectPoNazwieID(String nazwa){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Kierunek where nazwa='"+nazwa+"'");
        List<Kierunek> ker = select.list();
        if(ker.size()>0) return Integer.toString(ker.get(0).getId());
        else return "";
    }
    
    public List<Kierunek> selectbezND(){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Kierunek where nazwa<>'"+"Nie dotyczy"+"'");
        return select.list();
    }
    
    public void usunKierunek(int id){
        session = helper.getSession();
        session.beginTransaction();
        k = (Kierunek) session.get(Kierunek.class, id);
        session.delete(k);
        session.getTransaction().commit();
        
    }
    public void updateKierunek(Kierunek t){
        session = helper.getSession();
        session.beginTransaction();
        session.update(t);
        session.getTransaction().commit();
        
    }
    
}
