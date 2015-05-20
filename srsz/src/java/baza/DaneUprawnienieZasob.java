package baza;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class DaneUprawnienieZasob {
    private UprawnienieZasob u;
    private HibernateUtil helper;
    private static Session session;
    
    public void dodajUprawnienieZasob(Zasob idzas, Uprawnienie idupr, Osoby dodan,int tryb){
        u = new UprawnienieZasob(idzas,idupr,dodan,tryb);
        session = helper.getSession();
        session.beginTransaction();
        session.save(u);
        session.getTransaction().commit();
        
    }
    public UprawnienieZasob zczytajUprawnienieZasob(int id){
        UprawnienieZasob wyjscie;
        session = helper.getSession();
     
        wyjscie = (UprawnienieZasob) session.get(UprawnienieZasob.class, id);
        
        return wyjscie;
    }

    public void usunUprawnienieZasob(int id){
        session = helper.getSession();
        session.beginTransaction();
        u = (UprawnienieZasob) session.get(UprawnienieZasob.class, id);
        session.delete(u);
        session.getTransaction().commit();
        
    }
    
    public void updateUprawnienieZasob(UprawnienieZasob uz){
        session = helper.getSession();
        session.beginTransaction();
        session.update(uz);
        session.getTransaction().commit();
        
    }
    
     public static List<UprawnienieZasob> selectUprawnienieZasob()
    {
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from UprawnienieZasob ");
        return select.list();
    }
     public static List<UprawnienieZasob> selectUprawnienieZasobWhere(String where){
         session = HibernateUtil.getSession();
        Query select = session.createQuery("from UprawnienieZasob "+where);
        return select.list();
     }
     
     public boolean czyMoznaDodacUprawnienieDoZasobu(Uprawnienie upr, Zasob zas, int tryb){
         List<Uprawnienie> l = this.selectUprawnienieWhere("where id_zasob="+zas.getId()+" and id_uprawnienie="+upr.getId()+" and tryb="+tryb);
         if (l.size()>0) return false;
         return true;
     }
     
     public static List<Uprawnienie> selectUprawnienieWhere(String where){
         session = HibernateUtil.getSession();
         System.out.println("## "+where);
        Query select = session.createQuery("select id_uprawnienie from UprawnienieZasob "+where);
        return select.list();
     }   
     
}
