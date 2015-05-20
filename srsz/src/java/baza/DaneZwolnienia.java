package baza;

import org.hibernate.Session;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;

public class DaneZwolnienia {
    private Zwolnienia z;
    private static HibernateUtil helper;
    private static Session session;
    
    public void dodajZwolnienie(Osoby idprac, Date start, Date koniec, Osoby dod){
        z = new Zwolnienia(idprac,start,koniec,dod);
        session = helper.getSession();
        session.beginTransaction();
        session.save(z);
        session.getTransaction().commit();
        
    }
    
    public Zwolnienia zczytajZwolnienie(int n){
       Zwolnienia wyjscie;
       session = helper.getSession();
      
        wyjscie = (Zwolnienia) session.get(Zwolnienia.class, n);
        
        return wyjscie;
    }
    
    public void usunZwolnienie(int id){
        session = helper.getSession();
        session.beginTransaction();
        z = (Zwolnienia) session.get(Zwolnienia.class, id);
        session.delete(z);
        session.getTransaction().commit();
        
    }
    public void updateZwolnienia(Zwolnienia z){
        session = helper.getSession();
        session.beginTransaction();
        session.update(z);
        session.getTransaction().commit();
        
    }
    
    public static List<Zwolnienia> selectZwolnienia(){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Zwolnienia ");
        return select.list();
    }
    
    public static Zwolnienia selectZwolnieniaWhere(String wejscie){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Zwolnienia "+wejscie);
        List<Zwolnienia> lZ = select.list();
        if (lZ.size()>0) return lZ.get(0);
        else return null;
    }
    
}
