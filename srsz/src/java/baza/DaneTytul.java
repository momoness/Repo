package baza;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class DaneTytul {
    
    private Tytuly t;
    private static HibernateUtil helper;
    private static Session session;
   
    private String tytul;
    
    public String getTytul(int n){
        session = helper.getSession();
        t = (Tytuly) session.get(Tytuly.class, n);
        this.tytul = t.getTytul();
        
        return tytul;
    }
       
    public void setTytul(String t){
        this.tytul = t;
    }
        
    public void dodajTytul(String nowy){
        t = new Tytuly(nowy);
        session = helper.getSession();
        session.beginTransaction();
        session.save(t);
        session.getTransaction().commit();
        
    }
    
     public static Tytuly zczytajTytul(int id){
        Tytuly wyjscie = new Tytuly();
        session = helper.getSession();
       
        wyjscie = (Tytuly) session.get(Tytuly.class, id);
        
        return wyjscie;
    }
      
    public void dodajTytul(){
        t = new Tytuly(this.tytul);
        session = helper.getSession();
        session.beginTransaction();
        session.save(t);
        session.getTransaction().commit();
        
    }
    
    public static List<Tytuly> selectTytuly()
    {
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Tytuly ");
        return select.list();
    }
    
    public void usunTytul(int id){
        session = helper.getSession();
        session.beginTransaction();
        t = (Tytuly) session.get(Tytuly.class, id);
        session.delete(t);
        session.getTransaction().commit();
        
    }
    public void updateTytul(Tytuly t){
        session = helper.getSession();
        session.beginTransaction();
        session.update(t);
        session.getTransaction().commit();
        
    }
    
    public static List<String> selectSameTytuly(){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("select tytul from Tytuly");
        return select.list();
    }
    
    public Tytuly znajdzTytul(String tytul){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Tytuly where tytul='"+tytul+"'");
        List<Tytuly> lT = select.list();
        if (lT.size()>0)
            return lT.get(0);
        else return null;
    }
    
}
