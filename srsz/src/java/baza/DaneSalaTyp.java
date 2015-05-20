package baza;

import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class DaneSalaTyp {
    private SalaTyp s;
    private HibernateUtil helper;
    private static Session session;
       
    public void dodajSalaTyp(String opis){
        s = new SalaTyp(opis);
        session = helper.getSession();
        session.beginTransaction();
        session.save(s);
        session.getTransaction().commit();
        
    }
    
    public void usunSalaTyp(int id){        
        session = helper.getSession();
        session.beginTransaction();
        s = (SalaTyp) session.get(SalaTyp.class, id);
        session.delete(s);
        session.getTransaction().commit();
        
}
    public void updateSalaTyp(SalaTyp st){
        session = helper.getSession();
        session.beginTransaction();
        session.update(st);
        session.getTransaction().commit();
        
    }
    
    public static List<SalaTyp> selectSala()
    {
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from SalaTyp ");
        return select.list();
    }
    public static List<String> selectSalaTypOpis(){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("select opis from SalaTyp ");
        return select.list();
    }
    
    public SalaTyp zczytajSalaTyp(int id){
        SalaTyp wyjscie = new SalaTyp();
        session = helper.getSession();
     
        wyjscie = (SalaTyp) session.get(SalaTyp.class, id);
        
        return wyjscie;
    }
    
    public SalaTyp selectPoNazwie(String nazwa){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from SalaTyp where opis='"+nazwa+"'");
        List<SalaTyp> lST = select.list();
        if (lST.size()>0) return lST.get(0);
        else return null;
    }
    public static List<SalaTyp> selectbezND(){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from SalaTyp where opis<>'"+"Nie dotyczy"+"'");
        return select.list();
    }
    public String selectPoNazwieID(String nazwa){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from SalaTyp where opis='"+nazwa+"'");
        List<SalaTyp> lST = select.list();
        if (lST.size()>0) return Integer.toString(lST.get(0).getId());
        else return "";
    }
}
