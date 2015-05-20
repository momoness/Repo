package baza;

import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class DanePlanIgnoruj {
    private PlanIgnoruj p;
    private HibernateUtil helper;
    private static Session session;
       
    public void DanePlanIgnoruj(){}
    
    public void dodajPlanIgnoruj(Semestr id_semestr, Date dzien, Rezerwacja zajecia_id, String opis, Osoby dodany){
        p = new PlanIgnoruj( id_semestr, dzien, zajecia_id, opis, dodany);
        session = helper.getSession();
        session.beginTransaction();
        session.save(p);
        session.getTransaction().commit();
        
    }
    
    public void usunPlanIgnoruj(int id){
        session = helper.getSession();
        session.beginTransaction();
        p = (PlanIgnoruj) session.get(PlanIgnoruj.class, id);
        session.delete(p);
        session.getTransaction().commit();
        
    }
    
    public void updatePlanIgnoruj(PlanIgnoruj p){
        session = helper.getSession();
        session.beginTransaction();
        session.update(p);
        session.getTransaction().commit();
        
    }
    
    public static List<PlanIgnoruj> selectIgnoruj()
    {
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from PlanIgnoruj ");
        return select.list();
    }
    
    public PlanIgnoruj zczytajPlanIgnoruj(int id){
        session = helper.getSession();
       
        PlanIgnoruj wyjscie = (PlanIgnoruj) session.get(PlanIgnoruj.class, id);
        
        return wyjscie;
    }
            
            
    
}