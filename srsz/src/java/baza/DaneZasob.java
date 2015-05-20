
package baza;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class DaneZasob {
    
    private Zasob z;
    private HibernateUtil helper;
    private static Session session;
    
    public void dodajZasob(ZasobyTyp idtyp, SalaTyp idzasob, String naz, Osoby dod){
        z = new Zasob(idtyp,idzasob,naz,dod);
        session = helper.getSession();
        session.beginTransaction();
        session.save(z);
        session.getTransaction().commit();
        
    }
    
    
    public Zasob zczytajZasob(int id){
        Zasob wyjscie = new Zasob();
        session = helper.getSession();
        wyjscie = (Zasob) session.get(Zasob.class, id);
        
        return wyjscie;
    }
    
    public List<String> zczytajZasobNazwa(){
        session = HibernateUtil.getSession();       
        Query select = session.createQuery("select nazwa from Zasob ");
        List<String> wyjscie = select.list();
        //
        return wyjscie;
    }
    
    public void usunZasob(int id){
        session = helper.getSession();
        session.beginTransaction();
        z = (Zasob) session.get(Zasob.class, id);
        session.delete(z);
        session.getTransaction().commit();
        
    }
    public void updateZasob(Zasob z){
        session = helper.getSession();
        session.beginTransaction();
        session.update(z);
        session.getTransaction().commit();
        
    }
    
    public static List<Zasob> selectZasoby()
    {
        session = HibernateUtil.getSession();       
        Query select = session.createQuery("from Zasob ");
        List<Zasob> wyjscie = select.list();
        //
        return wyjscie;
    }   
    
    
    
    public Zasob selectZasobPoNazwie(String tekst){
        List<Zasob> lZ = this.selectZasoby(tekst);
        if (lZ.size()>0) return lZ.get(0);
        else return null;
    }
    
    
     
    public static List<Zasob> selectSale(){
        session = HibernateUtil.getSession();       
        Query select = session.createQuery("from Zasob where id_typ=1");
        List<Zasob> wyjscie = select.list();
        return wyjscie;
    }
    public static List<Zasob> selectNieSale(){
        session = HibernateUtil.getSession();       
        Query select = session.createQuery("from Zasob where id_typ<>1");
        List<Zasob> wyjscie = select.list();
        return wyjscie;
    }
    
    
    public Integer znajdzZasob(String nazwa){
        List<Zasob> lz = this.selectZasoby();
        for (int i=0; i<lz.size();i++)
            if (nazwa.compareTo(lz.get(i).getNazwa())==0) 
                return lz.get(i).getId();
        return null;
    }
    
    public static List<Zasob> selectZasoby(String tekst){
        session = HibernateUtil.getSession();    
        Query select = session.createQuery("from Zasob where nazwa='"+tekst+"'");
        List<Zasob> wyjscie = select.list();
        //
        return wyjscie;
    }
    
      public static List<Zasob> selectZasobySale()
    {
        session = HibernateUtil.getSession();      
        Query select = session.createQuery("from Zasob where id_sala<>5");
        List<Zasob> wyjscie = select.list();
        //
        return wyjscie;
    }
    
}
