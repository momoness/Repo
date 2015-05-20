package baza;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class DaneSemestrZmiany {
    private SemestrZmiany s;
    private HibernateUtil helper;
    private static Session session;
    
    public void dodajSemestrZmiany(Semestr id_semestr, Date dzien, Date dzien_tygodnia){
        s = new SemestrZmiany( id_semestr, dzien, dzien_tygodnia);
        session = helper.getSession();
        session.beginTransaction();
        session.save(s);
        session.getTransaction().commit();
        
    }
    
    public void usunSemestrZmiany(int id){
        session = helper.getSession();
        session.beginTransaction();
        s = (SemestrZmiany) session.get(SemestrZmiany.class, id);
        session.delete(s);
        session.getTransaction().commit();
        
    }
    
    public void updateSemestrZmiany(SemestrZmiany sz){
        session = helper.getSession();
        session.beginTransaction();
        session.update(sz);
        session.getTransaction().commit();
        
    }
    
    public static List<SemestrZmiany> selectSemestrZmiany(){
        session = HibernateUtil.getSession();     
        Query select = session.createQuery("from SemestrZmiany ");
        return select.list();
    }
    
    public SemestrZmiany zczytajSemestrZ(int id){
        SemestrZmiany wyjscie = new SemestrZmiany();
        session = helper.getSession();
     
        wyjscie = (SemestrZmiany) session.get(SemestrZmiany.class, id);
        
        return wyjscie;
    }
    public boolean sprawdzZmian(Date start){
        Date data = new Date();
        data=start;
        
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from SemestrZmiany");
        List<SemestrZmiany> lista = select.list();
        Format sdf = new SimpleDateFormat("yyyy-MM-dd");
        String zmienna1 = sdf.format(start);
        String zmienna2 = "";
        for (int i=0; i<lista.size(); i++){
            if (lista.size()>0){
                zmienna2 = sdf.format(lista.get(i).getDzien());
                if(zmienna2.equals(zmienna1))
                    return true;
            }
        }
        return false;
    }
}
