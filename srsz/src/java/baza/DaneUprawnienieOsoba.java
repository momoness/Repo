package baza;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class DaneUprawnienieOsoba {
    private UprawnienieOsoba u;
    private HibernateUtil helper;
    private static Session session;
    
    public void dodajUprawnienieOsoba(Osoby prac, Uprawnienie upr, Osoby dod){
        u = new UprawnienieOsoba(prac,upr,dod);
        session = helper.getSession();
        session.getTransaction().begin();
        session.save(u);
        session.getTransaction().commit();
        
    }
    
    public void usunUprawnienieOsoba(int id){
        session = helper.getSession();
        session.beginTransaction();
        u = (UprawnienieOsoba) session.get(UprawnienieOsoba.class, id);
        session.delete(u);
        session.getTransaction().commit();
        
    }
    
    public void updateUprawnienieOsoba(UprawnienieOsoba uo){
        session = helper.getSession();
        session.beginTransaction();
        session.update(uo);
        session.getTransaction().commit();
        
    }
    
    public UprawnienieOsoba zczytajUprawnienieOsoba(int id){
        UprawnienieOsoba wyjscie;
        session = helper.getSession();
    
        wyjscie = (UprawnienieOsoba) session.get(UprawnienieOsoba.class, id);
        
        return wyjscie;
    }
    
    public static List<UprawnienieOsoba> selectUprawnienieOsoba()
    {
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from UprawnienieOsoba ");
        return select.list();
    }
    
    public boolean czyOsobaNieMaUprawnienia(Uprawnienie upr, Osoby os){
        
        List<UprawnienieOsoba> l = this.selectWhere("where id_uprawnienie="+upr.getId()+" and id_prac="+os.getId());
        if (l.size()>0)
            return false;
        else return true;
    }
    public boolean czyAdmin(Osoby os){
        
        List<UprawnienieOsoba> l = this.selectWhere("where id_uprawnienie="+"1"+" and id_prac="+os.getId());
        if (l.size()>0)
            return true;
        else return false;
    }
    
    public static List<UprawnienieOsoba> selectWhere(String wpis){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from UprawnienieOsoba "+wpis);
        return select.list();
    }
    public static List<Uprawnienie> selectIdUprawnienWhere(String wpis){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("select id_uprawnienie from UprawnienieOsoba "+wpis);
        return select.list();
    }
}
