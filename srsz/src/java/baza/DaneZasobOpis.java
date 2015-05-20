package baza;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class DaneZasobOpis {
    private ZasobOpis z;
    private HibernateUtil helper;
    private static Session session;
    
    public void dodajZasobOpis(Zasob idzas, int ilosc, String opis){
        z = new ZasobOpis(idzas,ilosc,opis);
        session = helper.getSession();
        session.beginTransaction();
        session.save(z);
        session.getTransaction().commit();
        
    }
    public ZasobOpis zczytajZasobOpis(int id){
        ZasobOpis wyjscie = new ZasobOpis();
        session = helper.getSession();
       
        wyjscie = (ZasobOpis) session.get(ZasobOpis.class, id);
        
        return wyjscie;
    }
        
    public void usunZasobOpis(int id){
        session = helper.getSession();
        session.beginTransaction();
        z = (ZasobOpis) session.get(ZasobOpis.class, id);
        session.delete(z);
        session.getTransaction().commit();
        
    }
    public void updateZasobOpis(ZasobOpis zo){
        session = helper.getSession();
        session.beginTransaction();
        session.update(zo);
        session.getTransaction().commit();
        
    }
    
    public static List<ZasobOpis> selectZasobOpis()
    {
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from ZasobOpis ");
        return select.list();
    }
    
    public ZasobOpis selectPoZasobie(Integer nr)
    {
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from ZasobOpis where id_zasob='"+nr+"'");
        List<ZasobOpis> lZO = select.list();
        if (lZO.size()>0) return lZO.get(0);
        else return null;
    }
    
}
