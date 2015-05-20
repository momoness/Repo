package baza;

import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class DaneProsba {
    private Prosba p;
    private HibernateUtil helper;
    private static Session session;
        
    public DaneProsba(){}
    
    public void dodajProsba(Osoby wlasciciel, String powod,Date start, Date koniec, Zasob id_zasob, RezerwacjaTyp typ){
        p = new Prosba(wlasciciel,powod,start,koniec,id_zasob,typ);
        session = helper.getSession();
        session.beginTransaction();
        session.save(p);
        session.getTransaction().commit();
        
    }
    
    public Prosba zczytajProsba(int id){
        Prosba wyjscie = new Prosba();
        session = helper.getSession();
        
        wyjscie = (Prosba) session.get(Prosba.class, id);
        
        return wyjscie;
    }
    
    public void usunProsba(int id){        
        session = helper.getSession();
        session.beginTransaction();
        p = (Prosba) session.get(Prosba.class, id);
        session.delete(p);
        session.getTransaction().commit();
        
    }
    
    public void updateProsba(Prosba p){
        session = helper.getSession();
        session.beginTransaction();
        session.update(p);
        session.getTransaction().commit();
        
    }
    
    public static List<Prosba> selectProsba()
    {
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Prosba ");
        return select.list();
    }
    
    
     public static List<Prosba> selectProsbawlasc(int wlasc)
    {
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Prosba where wlasciciel=" + wlasc);
        return select.list();
    }
    
    public static List<String> selectProsbaPowod(){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("select powod from Prosba ");
        return select.list();
    }
    
}
