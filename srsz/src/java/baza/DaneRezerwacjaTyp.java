package baza;

import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class DaneRezerwacjaTyp {
    private RezerwacjaTyp r;
    private HibernateUtil helper;
    private static Session session;
    
    private String opis;     
    
    public DaneRezerwacjaTyp(){}
    
    public void dodajRezerwacjaTyp(String opis){
        r = new RezerwacjaTyp(opis);
        session = helper.getSession();
        session.beginTransaction();
        session.save(r);
        session.getTransaction().commit();
        
    }
    
    public RezerwacjaTyp zczytajRezerwacjaTyp(int id){
        session = HibernateUtil.getSession();   
        Query select = session.createQuery("from RezerwacjaTyp where id='"+id+"'");
        List<RezerwacjaTyp> rt = select.list();
        return rt.get(0);
    }
    
    public String getOpis(int n){
        session = helper.getSession();
        //session.beginTransaction();
        r = (RezerwacjaTyp) session.get(RezerwacjaTyp.class, n);
        this.opis = r.getOpis();
        
        return opis;
    }
    public void usunRezerwacjaTyp(int id){
        session = helper.getSession();
        session.beginTransaction();
        r = (RezerwacjaTyp) session.get(RezerwacjaTyp.class, id);
        session.delete(r);
        session.getTransaction().commit();
        
}
     public void updateRezerwacjaTyp(RezerwacjaTyp rt){
        session = helper.getSession();
        session.beginTransaction();
        session.update(rt);
        session.getTransaction().commit();
        
    }
       public static List<RezerwacjaTyp> selectRezTyp()
    {
        session = HibernateUtil.getSession();     
        Query select = session.createQuery("from RezerwacjaTyp ");
        return select.list();
    }
       public RezerwacjaTyp selectPoNazwie(String nazwa){
           session = HibernateUtil.getSession();     
            Query select = session.createQuery("from RezerwacjaTyp where opis_ty='"+nazwa+"'");
           List<RezerwacjaTyp> lRT = select.list();
           return lRT.get(0);
       }
       public static List<RezerwacjaTyp> selectRezTypbezInne()
    {
        session = HibernateUtil.getSession();     
        Query select = session.createQuery("from RezerwacjaTyp where opis_ty<>'"+"Inne"+"'");
        return select.list();
    }
       public String selectPoNazwieID(String nazwa){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from RezerwacjaTyp where opis_ty='"+nazwa+"'");
        List<RezerwacjaTyp> lZT = select.list();
        if (lZT.size()>0) return Integer.toString(lZT.get(0).getId());
        else return "";
    }
}
