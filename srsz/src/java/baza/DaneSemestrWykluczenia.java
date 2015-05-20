package baza;

import static java.lang.System.out;
import java.sql.Time;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class DaneSemestrWykluczenia {
    private SemestrWykluczenia p;
    private HibernateUtil helper;
    static private Session session;
    
    public void dodajSemestrWykluczenia(Semestr id_semestr, Date dzien, Date poczatek, Date koniec, String opis){
        p = new SemestrWykluczenia(id_semestr, dzien, poczatek, koniec, opis);
        session = helper.getSession();
        session.beginTransaction();
        session.save(p);
        session.getTransaction().commit();
        
    }
    
    public void usunSemestrWykluczenia(int id){
        session = helper.getSession();
        session.beginTransaction();
        p = (SemestrWykluczenia) session.get(SemestrWykluczenia.class, id);
        session.delete(p);
        session.getTransaction().commit();
        
    }
    public void updateSemestrWykluczenia(SemestrWykluczenia sw){
        session = helper.getSession();
        session.beginTransaction();
        session.update(sw);
        session.getTransaction().commit();
        
    }
    
    public static List<SemestrWykluczenia> selectSemestrWykluczenia()
    {
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from SemestrWykluczenia ");
        return select.list();
    }
    
    public SemestrWykluczenia zczytajSemestrW(int id){
        SemestrWykluczenia wyjscie = new SemestrWykluczenia();
        session = helper.getSession();
       
        wyjscie = (SemestrWykluczenia) session.get(SemestrWykluczenia.class, id);
        
        return wyjscie;
    }
    
    
}
