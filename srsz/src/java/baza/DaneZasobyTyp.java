package baza;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class DaneZasobyTyp {
    private ZasobyTyp z;
    private HibernateUtil helper;
    private static Session session;
    
    public String getOpis(int n){
        return this.zczytajZasobTyp(n).getOpis();        
    }
    
    public void dodajZasobTyp(String opis){
        z = new ZasobyTyp(opis);
        session = helper.getSession();
        session.beginTransaction();
        session.save(z);
        session.getTransaction().commit();
        
    }
    
    public ZasobyTyp zczytajZasobTyp(int n){
       ZasobyTyp wyjscie;
       session = helper.getSession();
   
        wyjscie = (ZasobyTyp) session.get(ZasobyTyp.class, n);
        
        return wyjscie;
    }
    public void usunZasobTyp(int id){
        session = helper.getSession();
        session.beginTransaction();
        z=(ZasobyTyp) session.get(ZasobyTyp.class, id);
        session.delete(z);
        session.getTransaction().commit();
        
    }
    
    public void updateZasobTyp(ZasobyTyp zt){
        session = helper.getSession();
        session.beginTransaction();
        session.update(zt);
        session.getTransaction().commit();
        
    }
       
    public static List<ZasobyTyp> selectTypy()
    {
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from ZasobyTyp ");
        return select.list();
    }
    
    public static List<String> selectTypyOpis(){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("select opis from ZasobyTyp ");
        return select.list();
    }
    
    public ZasobyTyp selectPoNazwie(String nazwa){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from ZasobyTyp where opis='"+nazwa+"'");
        List<ZasobyTyp> lZT = select.list();
        if (lZT.size()>0) return lZT.get(0);
        else return null;
    }

}
